function startCountdown() {
    var inputElement = document.getElementById("countdown-input");
    var form = document.getElementById("form");
    var list = document.getElementById("questionList");
    var number = parseInt(inputElement.value);
    var countdownButton2 = document.getElementById("countdown-button");

    form.style.display = "flex";
    countdownButton2.style.display = "none";
    var countdownDisplay = document.getElementById("countdown-display");
    var countdownInterval = setInterval(function () {
        if (number <= 0) {
            clearInterval(countdownInterval);
            countdownDisplay.innerHTML = "Time out!";
            list.style.display = "none";
        } else {
            countdownDisplay.innerHTML = number;
            number--;
        }
    }, 1000);
}

var countdownButton = document.getElementById("countdown-button");
countdownButton.addEventListener("click", startCountdown);