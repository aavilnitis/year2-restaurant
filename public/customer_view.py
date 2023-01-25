from flask import Blueprint,render_template

customer_view = Blueprint('customer_view', __name__)


@customer_view.route('/')
def home():
    return render_template("home.html")

@customer_view.route('/menu')
def menu():
    return render_template("menu.html")