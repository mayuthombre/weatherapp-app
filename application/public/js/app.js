const weatherForm = document.querySelector("form");
const search = document.querySelector("input");
const messageOne = document.querySelector("#message-1");
const messageTwo = document.querySelector("#message-2");
const body = document.querySelector("body")

weatherForm.addEventListener("submit", e => {
  e.preventDefault();

  const location = search.value;

  messageOne.textContent = "Loading...";
  messageTwo.textContent = "";

  fetch("/weather?address=" + location).then(response => {
    response.json().then(data => {
      if (data.error) {
        messageOne.textContent = data.error;
      } else {
        messageOne.textContent = data.forecast.summaryWeather;
        messageTwo.textContent = data.location;
      }

      if (data.forecast.temperature <= 0) {
        body.style.backgroundImage = "url('/img/cold.jpeg')";
      } else if (data.forecast.temperature < 25 ) {
        body.style.backgroundImage = "url('/img/moderate.jpeg')";
      } else {
        body.style.backgroundImage = "url('/img/hot.jpeg')";
      }
        
    });
  });
});
