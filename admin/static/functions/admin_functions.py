from flask import session, url_for, redirect, flash, request
from packages.models import Ingredient, Notification, MenuItem, User, db
import functools
import bcrypt
from sqlalchemy import text

def split_string(input_string):
    """Splits a comma separated string into a list of strings 

    Args:
        input_string (str): The comma separated string to be split

    Returns:
        List[str]: The list of the split strings
    """
    return [word.strip() for word in input_string.split(',')]

def names_to_array(ingredient_names):
    """Taks a list of ingredient names and returns an array of matching Ingredient objects from database

    Args:
        ingredient_names (List[str]): A list of ingredient names to be queried in database

    Returns:
        List: A list of Ingredient objects that matched in database with ingredient_names
    """
    ingredients = []
    # Iterate through all ingredients, if it matches in database add it to list
    for ingredient_name in ingredient_names:
        ingredient = Ingredient.query.filter_by(name=ingredient_name).first()
        if ingredient:
            ingredients.append(ingredient)
    return ingredients

def populate_menu():
    """Populated menu with data from the SQL file
    """
    # Open the SQL file and iterate through each line and execute the SQL statement
    with open("static/SQL_Inserts/populatemenu.sql", "r") as f:
        lines = f.readlines()
        for line in lines:
            db.session.execute(text(line))
            db.session.commit()

def admin_required(func):
    """Checks if current User is an Admin, if not redirects User to corresponding home page

    Args:
        func (function): The function to be decorated

    Returns:
        function: The decorated function
    """
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        if session.get('user') != 'admin':
            if session.get('user') == 'customer':
                return redirect(url_for('customer.home'))
            if session.get('user') == 'waiter':
                return redirect(url_for('waiter.home'))
            if session.get('user') == 'kitchen_staff':
                return redirect(url_for('kitchen.home'))
            else: 
                return "something went wrong"
        return func(*args, **kwargs)
    return wrapper

def check_cleared_notifs():
    """Check session data on stored notifications and return array of notifications from database
        that have not been cleared (aren't in cleared_notifs array)

    Returns:
        List: List of notifications from database that have not been cleared by admin
    """
    # If cleared_notifs array hasn't been initialised yet, initialise it
    if 'cleared_notifs' not in session:
        session['cleared_notifs'] = []
    notifications = []
    notifications_database = Notification.query.all()
    # Get list of cleared notifications
    cleared_notifs = session['cleared_notifs']
    # If notification not in cleared_notifs, add to list that's returned
    for notification in notifications_database:
        if notification.id not in cleared_notifs:
            notifications.append(notification)
    return notifications

def add_item():
    """Requests all data from add-item form and creates a new MenuItem object that is
        added to the database
    """
    # Request all data from the form
    name = request.form.get('name')
    price = request.form.get('price')
    description = request.form.get('description')
    ingredient_names = split_string(request.form.get('ingredients')) 
    calories = request.form.get('calories')
    type = request.form.get('type')
    picture = request.form.get('picture')
    # For each ingredient check if it's in database, if not, add it
    for ingredient_name in ingredient_names:
        if Ingredient.query.filter_by(name=ingredient_name).first() == None:
            db.session.add(Ingredient(name = ingredient_name))
            db.session.commit()
    # Split ingredients from a string to array
    ingredients = names_to_array(ingredient_names)
    menu_item = MenuItem(name=name, price=price, description=description, ingredients=ingredients, calories=calories, type=type, picture=picture)
    db.session.add(menu_item)
    db.session.commit()
    
def add_staff():
    """Requests all data from add-staff-member form and creates a new User object that is
        then added to the database. If new staff username is taken, redirects and flashes message

    Returns:
        flask.Response: Redirects admin back to staff page
    """
    user_type = request.form.get('user_type')
    username = request.form.get('username')
    
    users = User.query.all()
    usernames = []
    # Create a list of all taken usernames
    for user in users:
        usernames.append(user.username)
    if username in usernames:
        flash('Username already taken!', category='error')
        return redirect(url_for('admin.addNewStaff'))
    password = request.form.get('password')
    table_number = None
    table_number_start = None
    table_number_end = None
    # If user type is waiter, request table number info
    if user_type == 'waiter':
        table_number_start = request.form.get('table_number_start')
        table_number_end = request.form.get('table_number_end')
    user = User(username,bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()),user_type, table_number, table_number_start, table_number_end)
    db.session.add(user)
    db.session.commit()