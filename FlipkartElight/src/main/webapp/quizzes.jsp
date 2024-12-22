<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Skillgun Programming MCQ Quiz</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    padding: 30px;
}

h1 {
    text-align: center;
    color: #007bff;
    font-size: 36px;
}

form {
    max-width: 900px;
    margin: auto;
    background-color: #fff;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
}

.question {
    margin-bottom: 20px;
}

.options {
    margin-left: 20px;
}

.question p {
    font-weight: bold;
}

.options label {
    display: block;
    margin: 8px 0;
}

.question-number {
    font-weight: bold;
    color: #007bff;
    margin-right: 10px;
}


.buttons-container {
    display: flex;
    justify-content: space-between; /* Align buttons on the left and right */
    margin-top: 20px;
}


.submit-btn, .cancel-btn {
    padding: 12px 25px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    width: auto;
}


.submit-btn {
    background-color: #28a745;
}

.submit-btn:hover {
    background-color: #218838;
}


.cancel-btn {
    background-color: #dc3545;
}

.cancel-btn:hover {
    background-color: #c82333;
}


.cancel-btn a {
    color: white;
    text-decoration: none;
    display: inline-block;
    width: 100%;
    text-align: center;
}
</style>
</head>
<body>
    <h1>Skillgun Programming MCQ Quiz</h1>
    
    <form method="post" action="result.jsp">
        <% 
        // Define questions and options
        String[] questions = {
            "What is the correct syntax to print \"Hello World\" in C?",
            "Which of the following is a valid variable declaration in C?", 
            "How do you write a single-line comment in C?", 
            "Which data type is used to create a variable that should store text in C?",
            "What will be the output of `int a = 5; printf(\"%d\", a++);`?",
            "Which of the following functions is used to get a string input in C?",
            "What is the size of `int` in a 64-bit GCC compiler?",
            "Which keyword is used to prevent any changes to a variable in C?",
            "Which operator is used to access the address of a variable in C?", 
            "What does the function `free()` do in C?",
            // Additional questions
            "Which of the following is used for comments in C++?",
            "What is the output of `int a = 10, b = 5; cout << a / b;`?",
            "How do you create an object of the class `Car` in C++?",
            "What is the size of a `float` in C++?",
            "Which feature allows functions to have the same name with different parameters in C++?",
            "What will be the output of `int a = 5; cout << ++a;`?",
            "How do you allocate dynamic memory in C++?",
            "Which data type is used to store true or false values in C++?",
            "Which keyword is used to inherit a class in C++?",
            "What is a pointer in C++?",
            // Java questions
            "What is the default value of a boolean variable in Java?",
            "Which of the following is not a primitive data type in Java?",
            "Which method is used to start a thread in Java?",
            "What is the output of `System.out.println(10 % 3);`?",
            "Which exception is thrown when a class is not found?",
            // Python questions
            "How do you create a list in Python?", 
            "Which function is used to get the length of a list in Python?",
            "How do you write a comment in Python?", 
            "What is the output of `print(2 ** 3)`?", 
            "How do you create a function in Python?", 
            // Additional Python questions
            "What will be the output of `print('Hello ' + 'World')`?", 
            "Which function is used to add an element at the end of a list in Python?", 
            "How do you concatenate two lists in Python?", 
            "Which of the following is the correct way to open a file in Python?", 
            "What will be the output of `print(len([1, 2, 3]))`?"
        };

        String[][] options = {
            {"printf(\"Hello World\");", "print(\"Hello World\");", "echo(\"Hello World\");", "System.out.println(\"Hello World\");"},
            {"int num = 5;", "float = 7.5;", "var num = 5;", "num int = 5;"},
            {"/* This is a comment */", "# This is a comment", "// This is a comment", "<-- This is a comment"},
            {"char", "int", "float", "string"},
            {"4", "6", "5", "Error"},
            {"scanf()", "gets()", "input()", "getline()"},
            {"2 bytes", "4 bytes", "8 bytes", "16 bytes"},
            {"const", "final", "immutable", "static"},
            {"*", "&", "@", "%"},
            {"Deallocates previously allocated memory", "Allocates memory", "Clears the screen", "Exits the program"},
            // C++ questions
            {"# This is a comment", "<!-- This is a comment -->", "// This is a comment", "%% This is a comment"},
            {"10", "5", "2", "0.5"},
            {"Car obj;", "Car obj()", "Car = new obj", "obj Car;"},
            {"2 bytes", "4 bytes", "8 bytes", "16 bytes"},
            {"Polymorphism", "Function Overloading", "Encapsulation", "Inheritance"},
            {"4", "5", "6", "7"},
            {"alloc()", "malloc()", "new", "create()"},
            {"boolean", "int", "bool", "float"},
            {"extends", "implements", "inherits", "public"},
            {"A data type to store characters", "A function", "A variable storing memory address", "A class"},
            // Java questions
            {"false", "true", "0", "null"},
            {"char", "int", "String", "double"},
            {"start()", "run()", "begin()", "execute()"},
            {"10", "3", "7", "None of these"},
            {"ClassNotFoundException", "NullPointerException", "ArrayIndexOutOfBoundsException", "IOException"},
            // Python questions
            {"list()", "[ ]", "{ }", "< >"},
            {"len()", "size()", "count()", "length()"},
            {"# This is a comment", "// This is a comment", "<!-- This is a comment -->", "/* This is a comment */"},
            {"8", "5", "6", "10"},
            {"def my_function()", "function my_function()", "create my_function()", "func my_function()"},
            // Additional Python questions
            {"Hello World", "Hello World!", "Syntax Error", "Hello World \n"},
            {"append()", "add()", "insert()", "push()"},
            {"list1 + list2", "list1.concat(list2)", "concat(list1, list2)", "merge(list1, list2)"},
            {"open('file.txt', 'r')", "open('file.txt')", "file.open('file.txt')", "file.read('file.txt')"},
            {"3", "4", "5", "6"}
        };

        // Loop through questions to display them
        for (int i = 0; i < questions.length; i++) {
        %>
        <div class="question">
            <p><span class="question-number"><%= i + 1 %>. </span><%= questions[i] %></p>
            <div class="options">
                <label><input type="radio" name="q<%= i %>" value="a"> <%= options[i][0] %></label>
                <label><input type="radio" name="q<%= i %>" value="b"> <%= options[i][1] %></label>
                <label><input type="radio" name="q<%= i %>" value="c"> <%= options[i][2] %></label>
                <label><input type="radio" name="q<%= i %>" value="d"> <%= options[i][3] %></label>
            </div>
        </div>
        <% } %>

        <div class="buttons-container">
            <div class="cancel-btn">
                <a href="home.jsp">Cancel</a>
            </div>
            <div class="submit-btn">
                <button type="submit">Submit Quiz</button>
            </div>
        </div>
    </form>
</body>
</html>
