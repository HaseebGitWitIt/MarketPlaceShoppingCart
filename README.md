1.	 User wants to view ALL items in marketplace:
Using Postman, Prefix Verb: GET, URL: http://localhost:3000/api/productapi/v1/products/showMarketPlace/false, Send button
2.	 User wants to only view items in stock in marketplace:
Using Postman, Prefix Verb: GET, URL: http://localhost:3000/api/productapi/v1/products/showMarketPlace/true, Send button
3.	 User wants to add an item in marketplace:
     	Using Postman, Prefix Verb: POST, URL: http://localhost:3000/api/productapi/v1/products
Using Postman, Headers tab -> Key: Content-Type Application: application/json, Body tab ->    raw. Inside the text field, enter:
    	 {
        		 "title": "Temp Product",
        		 "price": 25,
         		"quantity": 10
    	 }
     	 And then hit send.
4.	 User wants to view a specific product in the marketplace:
Using Postman, Prefix Verb: GET, URL: http://localhost:3000/api/productapi/v1/products/:id, where id is the id of the product, Send button
5.	 User wants to update details of a product in the market place:
Using Postman, Prefix Verb: PATCH, URL: http://localhost:3000/api/productapi/v1/products/:id, where id is the id of the product you want to update
Using Postman, Headers tab -> Key: Content-Type Application: application/json, Body tab -> raw. Inside the text field, enter the fields you want to change:
{
        		 "title": "Changed Product",
      		 "price": 15,
      		 "quantity": 5
    	  }
     	 And then hit send.
6.	 User wants to remove an item from the market place:
Using Postman, Prefix Verb: DELETE, URL: http://localhost:3000/api/productapi/v1/products/:id, where id is the id of the product you want to remove, Send button
     	 NOTE: This will also remove this item from any shopping cart that has it. 
7.	If the user wants to purchase all of the items in a shopping cart:
Using Postman, Prefix Verb: POST, URL: http://localhost:3000/api/shoppingcartapi/v1/shopping_carts/purchase/:shoppingcartnum, where shoppingcartnum is the shopping cart number you want to purchase, Send button
NOTE: This will lower the stock of all products in the shopping cart by 1, and will ignore the products that are already out of stock.
8.	If the user wants to view all the items in a shopping cart:
Using Postman, Prefix Verb: GET, URL: http://localhost:3000/api/shoppingcartapi/v1/shopping_carts/getShoppingCartItems/:shoppingcartnum, where shoppingcartnum is the shopping cart number you want to view the items in, Send button
9.	If the user wants to view all the shopping carts:
Using Postman, Prefix Verb: GET, URL: http://localhost:3000/api/shoppingcartapi/v1/shopping_carts, Send button
10.	 If the user wants to add a product to a shopping cart:
Using Postman, Prefix Verb: POST, URL: http://localhost:3000/api/shoppingcartapi/v1/shopping_carts
Using Postman, Headers tab -> Key: Content-Type Application: application/json, Body tab -> raw. inside the text field, enter:
  	 {
      		 "shopping_cart_num": 1,
  	       	"product_num": 1
     	 }
     	 And then hit send. Note the total price will automatically be adjusted.
11.	User wants to view a specific shopping cart in the marketplace:
Using Postman, Prefix Verb: GET, URL: http://localhost:3000/api/shoppingcartapi/v1/shopping_carts/:id, where id is the id of the shopping cart, Send button
12.	 User wants to remove product shopping cart relationship:
Using Postman, Prefix Verb: DELETE, URL: http://localhost:3000/api/shoppingcartapi/v1/shoping_carts/:id, where id is the id of the shopping cart - product relationship you want to remove, Send button. Note the total price will automatocally be adjusted.
13.	  User wants to update details of a shopping cart - product relationship:
Using Postman, Prefix Verb: PATCH, URL: http://localhost:3000/api/shoppingcartapi/v1/shopping_carts/:id, where id is the id of the shopping cart - product relationship you want to update
Using Postman, Headers tab -> Key: Content-Type Application: application/json, Body tab -> raw. Inside the text field,  enter the fields you want to change:
     	  {
      		 "shopping_cart_num": 2,
        		 "product_num": 12
   	   }
      	   And then hit send. Note that the total price will be automatically adjusted.
14.	 User wants to remove shopping cart:
Using Postman, Prefix Verb: DELETE, URL: http://localhost:3000/api/shoppingcartapi/v1/shopping_carts/removeShoppingCart/:shoppingcartnum, where shoppingcartnum is the shopping cart number you want to remove, Send button
