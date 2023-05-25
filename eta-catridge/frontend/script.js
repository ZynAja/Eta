let btnCopy = `<button type="button" class="btn btn-secondary" onclick="copyText()"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-clipboard2" viewBox="0 0 16 16"><path d="M3.5 2a.5.5 0 0 0-.5.5v12a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-12a.5.5 0 0 0-.5-.5H12a.5.5 0 0 1 0-1h.5A1.5 1.5 0 0 1 14 2.5v12a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-12A1.5 1.5 0 0 1 3.5 1H4a.5.5 0 0 1 0 1h-.5Z"/><path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5Z"/></svg></button>`;

function tampil() {
  const selectPrinter = document.getElementById("printer");
  axios.get("http://127.0.0.1:8000/api/V1/printers").then(function (response) {
    let printer = response.data;
    printer.forEach((el) => {
      const option = document.createElement("option");
      option.value = el.warna;
      option.textContent = el.nama;
      selectPrinter.appendChild(option);
    });
  });
}

var noNota = "";
function booking() {
  var selectElement = document.getElementById("printer");
  var selectedOption = selectElement.selectedOptions[0];
  var printer = selectedOption.text;
  let dataPelanggan = {
    username: document.getElementById("nama").value,
    gedung: document.getElementById("gedung").value,
    area: document.getElementById("area").value,
    departemen: document.getElementById("departemen").value,
  };
  axios.post("http://127.0.0.1:8000/api/V1/pelanggans", dataPelanggan);

  let dataBooking = {
    id: Math.floor(100000 + Math.random() * 900000),
    pelanggan: document.getElementById("nama").value,
    printer: printer,
    warna: document.getElementById("warna").value,
    tinta: "1",
    status: "1",
  };

  axios
    .post("http://127.0.0.1:8000/api/V1/bookings", dataBooking)
    .then((noNota = dataBooking.id));
  alert("Berhasil Pesan");
  let nota = `<div>
    <h2>Pembelian Berhasil !</h2>
    <div class="row g-1 mt-4">
      <div class="col"><h5>NO NOTA : <input type="text" style="background: none; color: white; width: 75px;" id="textToCopy" value="${dataBooking.id}" readonly> ${btnCopy}</h2> <h4 class="text-danger">Simpan Nomor Nota Untuk Cek Status!</h4></div>
      <div class="col"><h5>Printer : ${dataBooking.printer}</h5><p class="bTinta">Tinta : ${dataBooking.warna}</p></div>
    </div>
  </div>

    <footer class="mt-auto text-white-50"><h3><a href="http://127.0.0.1:50000/frontend/">Memesan Lagi</a> </h3></footer>
  </div>`;
  document.querySelector(".lacak").innerHTML = nota;
}

function copyText() {
  var text = document.getElementById("textToCopy");
  text.select();
  document.execCommand("copy");
}

function lacak() {
  let nomorNota = document.getElementById("tLacak").value;
  axios
    .get("http://127.0.0.1:8000/api/V1/bookings/" + nomorNota)
    .then(function (response) {
      let lacak = response.data.data;
      let status = response.data.data.status;
      let warna;
      switch (status) {
        case "1":
          warna = "<p class='text-warning'>PENDING</p>";
          break;
        case "2":
          warna = "<p class='text-success'>READY TO PICKUP</p>";
          break;
        case "3":
          warna = "<p class='text-white'>FINISH</p>";
          break;
      }
      let out = `<table class="table text-white mt-2"><thead><tr><th scope="col">Nomor Nota</th><th scope="col">Nama</th><th scope="col">Warna</th><th scope="col">Printer</th><th scope="col">Status</th></tr></thead><tbody>`;
      out += `<tr>
                <th>${lacak.id}</th>
                <td>${lacak.pelanggan}</td>
                <td>${lacak.warna}</td>
                <td>${lacak.printer}</td>
                <td>${warna}</td>
              </tr>`;
      out += "</tbody></table>";
      document.getElementById("tampilLacak").innerHTML = out;
    });
}
