Accessing Databases via Web APIs
========================================================
author: PS239T
date: Fall 2016

What is an API?
========================================================

* API stands for **Application Programming Interface**

* a set of rules and procedures that facilitate interactions between computers and their applications

Web APIs
========================================================

* allows users to query a remote database over the internet

* take on a variety of formats 

* majority adhere to a particular style known as **Representational State Transfer** or **REST**

* "RESTful" APIs are convenient because we can use them to query databases using URLs 

RESTful Web APIs are All Around You...
========================================================

Consider a simple Google search.

Go ahead and search something.

Ever wonder what all that extra stuff in the address bar was all about?  

RESTful Web APIs are All Around You...
========================================================

It looks like Google makes its query by taking the search terms, separating each of them with a "`+`", and appending them to the link:

`https://www.google.com/#q=`

So that we have

`https://www.google.com/#q=search1+search2`

So can change our Google search by adding some terms to the URL.

Some Basic Terminology: URL
========================================================

* Uniform Resource Location
* a string of characters that, when interpreted via the Hypertext Transfer Protocol (HTTP)
* points to a data resource, notably files written in Hypertext Markup Language (HTML) or a subset of a database.


Some Basic Terminology: HTTP Methods / Verbs
========================================================

* *GET*: requests a representation of a data resource corresponding to a particular URL.  The process of executing the GET method is often referred to as a "GET request" and is the main method used for querying RESTful databases.
    
*  *HEAD*, *POST*, *PUT*, *DELETE*: other common methods, though mostly never used for database querying.

How Do GET Requests Work?  A Web Browsing Example
========================================================

* Surfing the Web = Making a bunch of GET Requests

* For instance, I open my web browser and type in http://www.wikipedia.org.  Once I hit return, I'd see a webpage.

* Several different processes occured, however, between me hitting "return" and the page finally being rendered. 

Step 1: The GET Request
========================================================

* web browser took the entered character string 
* used the command-line tool "Curl" to write a properly formatted HTTP GET request 
* submitted it to the server that hosts the Wikipedia homepage.

STEP 2: The Response
========================================================

* Wikipedia's server receives this request
* send back an HTTP response
* from which Curl extracted the HTML code for the page




```
Error in loadNamespace(name) : there is no package called 'httr'
```
