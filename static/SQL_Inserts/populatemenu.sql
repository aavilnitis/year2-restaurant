--INSERTING INGREDIENTS FOR EACH MENUITEM
--coca cola
INSERT INTO ingredients (name) VALUES ('carbonated water');--1
INSERT INTO ingredients (name) VALUES ('sugar');--2
INSERT INTO ingredients (name) VALUES ('Caffeine');--3

--iced tea
INSERT INTO ingredients (name) VALUES ('tea bags');--4
--2
INSERT INTO ingredients (name) VALUES ('lemons sliced');--5

--lemonade
--2
INSERT INTO ingredients (name) VALUES ('water');--6
INSERT INTO ingredients (name) VALUES ('lemon juice');--7

--toilet water
INSERT INTO ingredients (name) VALUES ('vodka');--8
INSERT INTO ingredients (name) VALUES ('triple sec');--9
INSERT INTO ingredients (name) VALUES ('lemon lime soda');--10

--cheese burger
INSERT INTO ingredients (name) VALUES ('cheese');--11
INSERT INTO ingredients (name) VALUES ('lettuce');--12
INSERT INTO ingredients (name) VALUES ('red onion');--13

--BLT
INSERT INTO ingredients (name) VALUES ('Bacon');--14
--12
INSERT INTO ingredients (name) VALUES ('tomato');--15

--chalk
--2
INSERT INTO ingredients (name) VALUES ('cocoa powder');--16
INSERT INTO ingredients (name) VALUES ('corn syrup');--17

--pepperoni pizza
--11
INSERT INTO ingredients (name) VALUES ('pepperoni');--18
INSERT INTO ingredients (name) VALUES ('garlic');--19

--BBQ wings
INSERT INTO ingredients (name) VALUES ('BBQ Sauce');--20
INSERT INTO ingredients (name) VALUES ('Sesame Seeds');--21

--Bread sticks
INSERT INTO ingredients (name) VALUES ('Wheat');--22
INSERT INTO ingredients (name) VALUES ('Gluten');--23
INSERT INTO ingredients (name) VALUES ('Butter');--24

--Boring salad
INSERT INTO ingredients (name) VALUES ('Leaves');--25

--french fries
INSERT INTO ingredients (name) VALUES ('Potato');--26

--Onion rings
INSERT INTO ingredients (name) VALUES ('Onions');--27

--Garlic bread
--22
--23
--24

--Chocolate brownies
INSERT INTO ingredients (name) VALUES ('Chocolate');--28
INSERT INTO ingredients (name) VALUES ('Milk');--29

--bubblegum sundae
INSERT INTO ingredients (name) VALUES ('Bubblegum syrup');--30
--28
--29

--vanilla cone
INSERT INTO ingredients (name) VALUES ('Vanilla');--31
--29


--STARTERS GO HERE:
--Inserting BBQ wings and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('BBQ Wings', 2.99, 'Its finger lickin good', 549, 'starters', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (1, 20);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (1, 21);

--Inserting Bread sticks and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Bread Sticks', 1.99, 'Buttered bread sticks made in thailand', 249, 'starters', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (2, 22);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (2, 23);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (2, 24);

--Inserting Boring salad and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Boring Salad', 4.99, 'The most boring food you can have!', 349, 'starters', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (3, 25);

--MAINS GO HERE: 
--Inserting Cheeseburger and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Cheeseburger', 8.99, 'Juicy beef patty topped with melted cheese and served on a sesame seed bun.', 480, 'mains', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (4, 11);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (4, 12);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (4, 13);

--Inserting BLT and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('BLT', 6.99, 'Crispy bacon, lettuce, and tomato served on white toast.', 720, 'mains', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (5, 14);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (5, 12);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (5, 15);

--Inserting Pepperoni pizza and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Worlds Largest Pepperoni Pizza', 99999.99, 'Our magnum opus, an eighty inch pizza. You wont get it through your door!', 10999, 'mains', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (6, 11);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (6, 18);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (6, 19);

--SIDES GO HERE:
--Inserting Chalk and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Chalk', 777.99, 'Its just chalk.', 2199, 'sides', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (7, 2);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (7, 16);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (7, 17);

--Inserting French fries and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('French Fries', 2.99, 'The best fries in the world!', 399, 'sides', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (8, 26);

--Inserting Garlic bread and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Garlic Bread', 3.99, 'Buttered garlic bread', 199, 'sides', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (9, 22);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (9, 23);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (9, 24);

--Inserting Onion rings and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Onion Rings', 4.99, 'Crispy clean onion rings', 599, 'sides', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (10, 27);

--DESSERTS GO HERE:
--Inserting Chocolate brownie and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Chocolate Brownies', 5.29, 'Lots and lots of Chocolate!', 849, 'desserts', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (11, 28);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (11, 29);

--Inserting Bubblegum Sundae and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Bubblegum Sundae', 4.99, 'Bubblegum sundae? Yes please!', 689, 'desserts', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (12, 28);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (12, 29);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (12, 30);

--Inserting Vanilla cone and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Vanilla Cone', 4.99, 'A very boring dessert...', 579, 'desserts', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (13, 29);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (13, 31);

--Inserting CocaCola and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Coca-Cola', 2.99, 'Classic soda made with real sugar.', 40, 'drinks', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (14, 1);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (14, 2);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (14, 3);

--Inserting Iced tea and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Iced Tea', 2.49, 'Refreshing iced tea made with real tea leaves.', 5, 'drinks', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (15, 2);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (15, 4);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (15, 5);

--Inserting Lemonade and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Lemonade', 2.99, 'Tart and sweet homemade lemonade.', 21, 'drinks', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (16, 2);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (16, 6);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (16, 7);

--Inserting Toilet Water and Ingredients
INSERT INTO menu_items (name, price, description, calories, type, picture) VALUES ('Toilet Water', 50000.99, 'Its better than you think', 102, 'drinks', 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png');
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (17, 8);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (17, 9);
INSERT INTO menu_item_ingredient (menu_item_id, ingredient_id) VALUES (17, 10);