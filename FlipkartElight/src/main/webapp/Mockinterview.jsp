<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mock Interview</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-danger {
            width: 100%;
            font-size: 16px;
            font-weight: bold;
        }
        .btn-danger:disabled {
            background-color: #e0e0e0;
            cursor: not-allowed;
        }
        .text-danger {
            color: red;
        }
        @media screen and (max-width: 768px) {
            .form-group {
                width: 100%;
            }
        }
    </style>
    <script>
        function enableSubmitButton() {
            const confirmationCheckBox = document.getElementById("confirmationCheckbox");
            const submitButton = document.getElementById("submitButton");
            submitButton.disabled = !confirmationCheckBox.checked;
        }

        function submitDetails() {
            
            const interviewDate = document.getElementById("interviewDate").value;
            const timeSlot = document.querySelector('input[name="timeSlot"]:checked').value;
            const interviewMode = document.querySelector('input[name="interviewMode"]:checked').value;
            const subject = document.getElementById("subjectDropdown").value;

            
            const attendeeName = prompt("Enter your name:");
            const attendeeEmail = prompt("Enter your email:");
            const attendeePhone = prompt("Enter your phone number:");

            
            if (!attendeeName || !attendeeEmail || !attendeePhone) {
                alert("Please provide valid details to submit!");
                return;
            }

            
            document.getElementById("formName").value = attendeeName;
            document.getElementById("formEmail").value = attendeeEmail;
            document.getElementById("formPhone").value = attendeePhone;
            document.getElementById("formDate").value = interviewDate;
            document.getElementById("formTimeSlot").value = timeSlot;
            document.getElementById("formMode").value = interviewMode;
            document.getElementById("formSubject").value = subject;

          
            document.getElementById("mockInterviewForm").submit();
        }
    </script>
</head>
<body>
<div class="container">
    <h2 class="text-center">Schedule Your Mock Interview</h2>
    <div class="form-group">
        <label>Do you want to schedule your mock interview?</label><br>
        <input type="checkbox" id="mockCheckBox"> Yes
    </div>

    <div id="scheduleForm">
        <div class="form-group">
            <label for="interviewDate">Interview Date:</label>
            <input type="date" class="form-control" id="interviewDate">
        </div>
        <div class="form-group">
            <label>Interview Time:</label><br>
            <input type="radio" name="timeSlot" value="Morning" id="morningSlot" checked>
            <label for="morningSlot">Morning Slot</label><br>
            <input type="radio" name="timeSlot" value="Evening" id="eveningSlot">
            <label for="eveningSlot">Evening Slot</label>
        </div>
        <div class="form-group">
            <label>Mode of Interview:</label><br>
            <input type="radio" name="interviewMode" value="Face to Face" id="faceToFace" checked>
            <label for="faceToFace">Face to Face</label><br>
            <input type="radio" name="interviewMode" value="Virtual" id="virtualMode">
            <label for="virtualMode">Virtual</label>
        </div>
        <div class="form-group">
            <label for="subjectDropdown">Subject:</label>
            <select class="form-control" id="subjectDropdown">
                <option value="MySQL">MySQL</option>
                <option value="Java">Java</option>
                <option value="Spring Boot">Spring Boot</option>
            </select>
        </div>
        <div class="form-group">
            <input type="checkbox" id="confirmationCheckbox" onclick="enableSubmitButton()">
            <span class="text-danger">I confirm I am prepared and will attend the interview without fail.</span>
        </div>
        <button id="submitButton" class="btn btn-danger" onclick="submitDetails()" disabled>Submit</button>
    </div>

    
    <form id="mockInterviewForm" action="storeDetails.jsp" method="POST" style="display:none;">
        <input type="hidden" id="formName" name="name">
        <input type="hidden" id="formEmail" name="email">
        <input type="hidden" id="formPhone" name="phone">
        <input type="hidden" id="formDate" name="date">
        <input type="hidden" id="formTimeSlot" name="timeSlot">
        <input type="hidden" id="formMode" name="mode">
        <input type="hidden" id="formSubject" name="subject">
    </form>
</div>
</body>
</html>
