from packages.extensions import db

class Ingredient(db.Model):
    __tablename__ = "ingredients"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String(100), nullable = False)

    def __init__(self, name):
        self.name = name

menu_item_ingredient = db.Table("menu_item_ingredient",
    db.Column("menu_item_id", db.Integer, db.ForeignKey("menu_items.id"), primary_key=True),
    db.Column("ingredient_id", db.Integer, db.ForeignKey("ingredients.id"), primary_key=True)
) 

class MenuItem(db.Model):
    __tablename__ = "menu_items"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String(100), nullable = False)
    price = db.Column(db.Float, nullable = False)
    description = db.Column(db.String(300))
    ingredients = db.relationship("Ingredient", secondary=menu_item_ingredient, lazy="dynamic")
    calories = db.Column(db.Integer)
    type = db.Column(db.Enum('food', 'drink', name='MenuItem_type'), nullable = False)

    def __init__(self, name, price, description, type):
        self.name = name
        self.price = price
        self.description = description
        self.type = type

class Order(db.Model):
    __tablename__ = "orders"
    id = db.Column(db.Integer, primary_key = True)
    order_menu_items = db.relationship("OrderMenuItem", backref = "order", lazy = "dynamic")
    order_total = db.Column(db.Float, nullable = False, default = 0)
    status = db.Column(db.Enum('complete', 'incomplete', name='order_status'), nullable = False, default = 'incomplete')
    
    def __init__(self, order_menu_items, order_total = 0, status = 'incomplete'):
        self.order_menu_items = order_menu_items
        self.order_total = order_total
        self.status = status

class OrderMenuItem(db.Model):
    __tablename__ = "order_menu_item"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    order_id = db.Column(db.Integer, db.ForeignKey("orders.id"), nullable = False)
    menu_item_id = db.Column(db.Integer, db.ForeignKey("menu_items.id"), nullable = False)
    quantity = db.Column(db.Integer, nullable = False, default = 1)


class User(db.Model):
    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    username = db.Column(db.String(100), unique = True, nullable = False)
    password = db.Column(db.String(1000), nullable = False)
    user_type = db.Column(db.Enum('customer', 'waiter', name='user_type'), nullable = False)

    def __init__(self, username, password, user_type):
        self.username = username
        self.password = password
        self.user_type = user_type