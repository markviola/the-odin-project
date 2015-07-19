#2 - Web Server and Browser

Use HTTP requests to create a simple server and browser. The GET and POST request will be used to simulate what it would be like to browse the web as well as simulate what can potentially occur when the user presses a 'Submit' button and sends data to the server.

######To run:
```
cd 10-ruby-on-the-web/2 - Web Server and Browser
```

In one terminal window, set up the server:
```
ruby server.rb
```

In another terminal window, run the pseudo browser:
```
ruby browser.rb
```

######Outcome:

GET request (by default will GET the index.html file for localhost:2000):
```
What is your request(GET or POST): **GET**
```
```
HTTP/1.0 200 OK
Sat Jul 18 20:23:30 2015
Content-Type: text/html
Content-Lenght: 67
<html>
	<body>
		<h1>Welcome to the Home Page</h1>
	</body>
</html>
```

POST request:
```
What is your request(GET or POST): **POST**
Enter your name: **Mark**
Enter your email: **mark.anthony.viola@gmail.com**
```
```
HTTP/1.0 200 OK
Sat Jul 18 20:24:09 2015
Content-Type: text/html
Content-Lenght: 133
<html>
	<body>
		<h1>Thanks for posting!</h1>
		<h2>Here's what we got from you: </h2>
		<ul>
			<li>Name: Mark</li> <li>Email: mark.anthony.viola@gmail.com</li>
		</ul>
	</body>
</html>
```