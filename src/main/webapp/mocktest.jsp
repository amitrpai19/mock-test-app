<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Mock Test</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body {
    background: #f5f6fa;
}

/* Header */

.exam-header {
    border-bottom: 3px solid black;
    padding: 15px 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* Info Card */

.exam-info {
    border-radius: 30px;
    padding: 30px;
    margin-top: 20px;
}

/* Question Box */

.question-box {
    border: 2px solid #333;
    padding: 25px;
    min-height: 260px;
}

/* Question Palette */

.palette {
    border: 2px solid #333;
    padding: 20px;
}

.qsquare {
    width: 32px;
    height: 32px;
    margin: 4px;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    background: #ccc;
    cursor: pointer;
}

.attempted {
    background: #28a745;
    color: white;
}

</style>

</head>

<body>


<!-- Header -->

<div class="exam-header">

    <h4>Java Mock Test</h4>

    <button class="btn btn-danger" onclick="submitTest()">
        Submit
    </button>

</div>



<div class="container mt-4">


<!-- Info Card -->

<div class="card exam-info shadow">

<div class="row text-center">

<div class="col-md-4">
<h5>Total Questions</h5>
<h3 id="totalQ">10</h3>
</div>

<div class="col-md-4">
<h5>Attempted</h5>
<h3 id="attemptedCount">0</h3>
</div>

<div class="col-md-4">
<h5>Timer</h5>
<h3 id="timer">05:00</h3>
</div>

</div>

</div>



<div class="row mt-4">

<!-- Question Section -->

<div class="col-md-8">

<div class="question-box">

<h5 id="questionText"></h5>

<div id="optionsContainer" class="mt-3"></div>

<br>

<button class="btn btn-secondary"
        onclick="prevQuestion()">
        Previous
</button>

<button class="btn btn-primary"
        onclick="nextQuestion()">
        Next
</button>

</div>

</div>



<!-- Question Palette -->

<div class="col-md-4">

<div class="palette">

<h6>Questions</h6>

<div id="paletteContainer"></div>

</div>

</div>

</div>

</div>



<script>

/* Global Variables */

let totalQuestions = 10
let currentQuestion = 1
let answers = {}


/* Question Data */

let questions = {

1 : {
    question : "What is JVM?",
    options : {
        A : "Java Virtual Machine",
        B : "Java Vendor Machine",
        C : "Java Verified Mode",
        D : "Joint Virtual Module"
    }
},

2 : {
    question : "What is JDK?",
    options : {
        A : "Java Deployment Kit",
        B : "Java Development Kit",
        C : "Java Debug Kit",
        D : "Java Design Kit"
    }
},

3 : {
    question : "Which keyword is used for inheritance?",
    options : {
        A : "inherit",
        B : "this",
        C : "extends",
        D : "implements"
    }
},

4 : {
    question : "Which collection is synchronized?",
    options : {
        A : "ArrayList",
        B : "Vector",
        C : "HashSet",
        D : "LinkedList"
    }
},

5 : {
    question : "Which company created Java?",
    options : {
        A : "Microsoft",
        B : "Sun Microsystems",
        C : "Google",
        D : "IBM"
    }
},

6 : {
    question : "Which package contains Scanner?",
    options : {
        A : "java.io",
        B : "java.net",
        C : "java.util",
        D : "java.lang"
    }
},

7 : {
    question : "Which keyword stops inheritance?",
    options : {
        A : "final",
        B : "static",
        C : "private",
        D : "protected"
    }
},

8 : {
    question : "What is garbage collection?",
    options : {
        A : "Memory cleanup",
        B : "File deletion",
        C : "Code compilation",
        D : "Variable declaration"
    }
},

9 : {
    question : "Which interface does ArrayList implement?",
    options : {
        A : "Set",
        B : "Queue",
        C : "List",
        D : "Map"
    }
},

10 : {
    question : "Which keyword refers to current object?",
    options : {
        A : "super",
        B : "static",
        C : "this",
        D : "void"
    }
}

}



/* Load Question Palette */

function loadPalette()
{

    let container = document.getElementById("paletteContainer")

    for(let i=1;i<=totalQuestions;i++)
    {

        let box = document.createElement("div")

        box.classList.add("qsquare")
        box.id = "qbox" + i
        box.innerText = i

        box.onclick = function()
        {
            loadQuestion(i)
        }

        container.appendChild(box)
    }

}

loadPalette()



/* Load Question */

function loadQuestion(qno)
{

    currentQuestion = qno

    let q = questions[qno]

    document.getElementById("questionText").innerText =
        "Q" + qno + ". " + q.question


    let optionHTML = ""

    for(let key in q.options)
    {

        optionHTML +=

        `<div class="form-check">

            <input class="form-check-input"
                   type="radio"
                   name="option"
                   value="${key}"
                   onclick="saveAnswer()"
                   id="opt${key}">

            <label class="form-check-label" for="opt${key}">
                ${key}. ${q.options[key]}
            </label>

        </div>`

    }

    document.getElementById("optionsContainer").innerHTML = optionHTML


    /* Restore answer */

    if(answers[qno])
    {
        document.querySelector(
            'input[value="'+answers[qno]+'"]'
        ).checked = true
    }

}



/* Save Answer */

function saveAnswer()
{

    let selected =
        document.querySelector('input[name="option"]:checked').value

    answers[currentQuestion] = selected

    document.getElementById("qbox"+currentQuestion)
        .classList.add("attempted")

    document.getElementById("attemptedCount")
        .innerText = Object.keys(answers).length

}



/* Next Question */

function nextQuestion()
{

    if(currentQuestion < totalQuestions)
    {
        loadQuestion(currentQuestion + 1)
    }

}



/* Previous Question */

function prevQuestion()
{

    if(currentQuestion > 1)
    {
        loadQuestion(currentQuestion - 1)
    }

}



/* Timer */

let time = 300

function startTimer()
{

    let interval = setInterval(function(){

        let minutes = Math.floor(time / 60)
        let seconds = time % 60

        document.getElementById("timer").innerText =
            minutes + ":" + (seconds < 10 ? "0"+seconds : seconds)

        time--

        if(time < 0)
        {
            clearInterval(interval)
            autoSubmit()
        }

    },1000)

}

startTimer()



/* AJAX Auto Submit */

function autoSubmit()
{

    let xhr = new XMLHttpRequest()

    xhr.open("POST","submitTest",true)

    xhr.setRequestHeader(
        "Content-Type",
        "application/json"
    )

    xhr.send(JSON.stringify(answers))

    alert("Time up! Test submitted automatically.")

}



/* Manual Submit */

function submitTest()
{
    autoSubmit()
}



/* Load First Question */

loadQuestion(1)

</script>


</body>
</html>