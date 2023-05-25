function login() {
  let username = document.getElementById("username").value;
  let password = document.getElementById("password").value;
  let data = {
    username: username,
    password: password,
  };
  axios
    .post("http://127.0.0.1:8000/api/V1/login", data)
    .then(function (response) {
      let login = response.data;
      if (login === "bener") {
        localStorage.setItem("isLoggedIn", "true");
        window.location.href = "http://127.0.0.1:50000/backend/";
      } else {
        alert("Username / Password Salah");
        location.reload();
      }
    })
    .catch(function (response) {
      let message = response.response.data.message;
      let out = `<div class="alert alert-danger" role="alert">${message}</div>`;
      document.querySelector(".err").innerHTML = out;
    });
}
