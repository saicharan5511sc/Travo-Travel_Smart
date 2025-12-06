
# Travo-Travel-Smart

Travo is a simple and clean travel management system built using JSP, Servlets, and MySQL. It helps users search trips, register, log in, book tickets, and view their booking history. The goal is to offer a smooth and fast travel experience while using a clear MVC pattern on the backend.

## Features
- User registration and login with session handling  
- Trip search with destination listing  
- Fare calculation and booking creation  
- Booking history for each user  
- Input validation on server side  
- MySQL based data storage for users, destinations, and bookings  
- Clean project structure that follows MVC style design  

## Tech Stack
- Frontend: JSP, HTML, CSS  
- Backend: Java Servlets  
- Database: MySQL  
- Server: Apache Tomcat  
- Architecture: MVC style structure  

## Project Structure
Travo/  
├── src/  
│   ├── controllers/       Servlet classes  
│   ├── dao/               Data access logic  
│   ├── models/            Data models  
├── WebContent/  
│   ├── pages/             JSP pages  
│   ├── css/               Styling files  
│   ├── js/                Scripts  
└── database/              Optional folder for schema notes

## Database Setup
1. Create a database in MySQL:  
create database travo;  
2. Create required tables manually based on your field names.  
3. Update connection details in your DAO classes (url, username, password).
## How to Run the Project
1. Import the project into Eclipse  
2. Add Apache Tomcat server  
3. Start the server  
4. Open the project in your browser:  


## What This Project Demonstrates
Travo shows strong fundamentals in Java based web development. It highlights your skills in JSP and Servlets, MVC application flow, database design and SQL, form validation, session handling, and building a working web application from scratch.

## Future Improvements
- Admin dashboard for managing destinations and bookings  
- Payment integration  
- Email notifications  
- Multi city travel planning  
## Author
Developed by Sai Charan  
GitHub: https://github.com/saicharan5511sc
## License
This project is for learning and portfolio use.