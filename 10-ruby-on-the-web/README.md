#10 - Ruby on the Web

The two exercises focus on interaction with servers. Specifically, the Twitter Spambot exercise focuses on the use of Twitter API to interact with Twitter servers, whereas the Web Server and Browser exercise focuses on the basics of creating a server and how to interact with that server using HTTP requests.

####1 - Twitter Spambot

Use Twitter API to programmatically send tweets out through your own personal account. This program allows the user to create a tweet, send a direct message to an individual, send a message to all of their followers, and print out the last tweets of the people they are following themselves.  

######To run:
```
cd 10-ruby-on-the-web/1 - Twitter Spambot
```
```
ruby micro_blogger.rb
```

######Outcome:
```
Initializing...
Welcome to the JSL Twitter Client!
```

Send a tweet:
```
Enter a command: **t Hello World!**
```

Direct message a follower:
```
Enter a command: **dm username This is the message**
```

Spam everyone who is a follower:
```
Enter a command: **spam This is spam**
```

####2 - Web Server and Browser

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