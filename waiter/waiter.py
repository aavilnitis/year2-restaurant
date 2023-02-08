from flask import Blueprint, render_template, request, redirect, session, jsonify, url_for
from packages.models import MenuItem, Order, db, Ingredient
from sqlalchemy.sql import text

# register customer_view as a Flask Blueprint
waiter = Blueprint("waiter", __name__, static_folder="static",
                   template_folder="templates")

def split_string(input_string):
    return [word.strip() for word in input_string.split(',')]


@waiter.route('/')
def home():
    return render_template('waiter-home.html')


@waiter.route('/menu')
def menu():
    menu_items = MenuItem.query.all()
    return render_template('waiter-menu.html', items=menu_items)


@waiter.route('/add-item', methods=['GET', 'POST'])
def add_item():
    if request.method == 'POST':
        name = request.form.get('name')
        price = request.form.get('price')
        description = request.form.get('description')
        ingredients = split_string(request.form.get('ingredients'))
        for ingredient in ingredients:
            if Ingredient.query.filter_by(name=ingredient).first() == None:
                db.session.add(Ingredient(ingredient))
                db.session.commit()
        calories = request.form.get('calories')
        type = request.form.get('type')

        return type
    return render_template('add_item.html')

# Flask route to cancel an order
# Delete the order from the database


@waiter.route('/cancel_order/<int:order_id>', methods=['POST'])
def cancel_order(order_id):
    order = Order.query.get(order_id)
    db.delete(order)
    db.commit()
    return redirect(url_for('orders'))

# Flask route to confirm order
# Update the status of the order


@waiter.route('/confirm_order/<int:order_id>', methods=['POST'])
def confirm_order(order_id):
    order = Order.query.get(order_id)
    order.status = "complete"
    db.session.commit()
    return redirect(url_for('orders'))
