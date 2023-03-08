from flask import session, url_for, redirect, flash
from packages.models import Notification, db
import functools
from sqlalchemy import text

# Populates the database with premade SQL inserts
def populate_menu():
    with open("static/SQL_Inserts/populatemenu.sql", "r") as f:
        lines = f.readlines()
        for line in lines:
            db.session.execute(text(line))
            db.session.commit()
            
def customer_required(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        if session.get('user') != 'customer':
            if session.get('user') == 'waiter':
                return redirect(url_for('waiter.home'))
            else: 
                return "something went wrong"
        return func(*args, **kwargs)
    return wrapper

def notification(type):
    user_id = session['user_id']
    table = session['table_number']
    if user_id and table:
        notif = Notification(user_id, table, type)
        db.session.add(notif)
        db.session.commit()
        if type == 'table':
            flash("Waiter has been informed about your table selection!", category='success')
        else:
            flash("Waiter has been notified!", category='success')
    else:
        flash("Something went wrong!", category = "error")