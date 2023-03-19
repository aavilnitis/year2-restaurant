from flask import session, url_for, redirect, flash
from packages.models import Notification, User, db
import functools
from sqlalchemy import text

def populate_menu():
    """Populates the menu with data from the SQL file
    """
    # Open the SQL file and iterate through each line and execute the SQL statement
    with open("static/SQL_Inserts/populatemenu.sql", "r") as f:
        lines = f.readlines()
        for line in lines:
            db.session.execute(text(line))
            db.session.commit()
            
def customer_required(func):
    """Checks if current User is a Customer, if not redirects User to corresponding home page

    Args:
        func (function): The function to be decorated

    Returns:
        function: The decorated function
    """
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        """Checks if current User is a Customer, if not redirects User to corresponding home page if they are not

        Returns:
            function: The decorated function
        """
        # Checks User.user_type and redirects User to corresponding home page
        if session.get('user') != 'customer':
            if session.get('user') == 'waiter':
                return redirect(url_for('waiter.home'))
            if session.get('user') == 'admin':
                return redirect(url_for('admin.home'))
            if session.get('user') == 'kitchen':
                return redirect(url_for('kitchen.home'))
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
        
def check_tables():
    customers = User.query.filter_by(user_type='customer')
    taken_tables = []
    if customers:
        for customer in customers:
            taken_tables.append(customer.table_number)
        print(taken_tables)
    else:
        taken_tables = []
    free_tables = []
    for i in range(50):
        if not (i+1) in taken_tables:
            free_tables.append((i+1))
    return free_tables
