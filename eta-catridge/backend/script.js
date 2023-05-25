let btnEdit = `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16"><path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/></svg>`;
let btnHapus = `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16"><path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/></svg>`;
let btnTambah = `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/></svg>`;

function logout() {
  localStorage.removeItem("isLoggedIn");
  window.location.href = "http://127.0.0.1:50000/index.html";
}

function printer() {
  axios.get("http://127.0.0.1:8000/api/V1/printers").then(function (response) {
    let printer = response.data;
    let out =
      "<table class='table'><thead><tr><th scope='col'>No</th><th scope='col'>Printer</th><th scope='col'>Warna Catridge</th><th scope='col'>Hapus</th></tr></thead><tbody>";
    printer.forEach((el, index) => {
      let warna;
      switch (el.warna) {
        case "1":
          warna = "Black";
          break;
        case "2":
          warna = "Black & Color";
          break;
      }
      let number = index + 1;
      out += `<tr>
                <td>${number}</td>
                <td>${el.nama}</td>
                <td>${warna}</td>
                <td><button type="button" class="btn btn-danger" onclick="hapusPrinter(${el.id})">${btnHapus}</button></td>
            </tr>`;
    });
    out += "</tbody></table>";
    document.querySelector(".cont").innerHTML = out;
    let btn =
      '<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Tambah Printer</button>';
    document.querySelector(".btn").innerHTML = btn;
  });
}

function tambahPrinter() {
  let data = {
    nama: document.getElementById("nama").value,
    warna: document.getElementById("warna").value,
  };
  axios.post("http://127.0.0.1:8000/api/V1/printers", data);
  document.getElementById("nama").value = "";
  document.getElementById("warna").value = "pilih";
  alert("printer sudah diinput");
  printer();
}

function hapusPrinter(id) {
  axios.delete("http://127.0.0.1:8000/api/V1/printers/" + id);
  alert("Berhasil Menghapus Printer");
  printer();
}

var data = {};
function tinta() {
  axios.get("http://127.0.0.1:8000/api/V1/tintas").then(function (response) {
    let tinta = response.data;
    let out =
      "<table class='table'><thead><tr><th scope='col'>No</th><th scope='col'>Nama Tinta</th><th scope='col'>Minimum Stok</th><th scope='col'>Stok</th><th></th></tr></thead><tbody>";
    tinta.forEach((el, index) => {
      data = {
        id: el.id,
        stok: el.stok,
      };
      let number = index + 1;
      out += `<tr>
                <td>${number}</td>
                <td>${el.namatinta}</td>
                <td>${el.minQ}</td>
                <td>${el.stok}</td>
                <td><button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal3" onclick="tampilTinta(${el.id})">${btnEdit}</button><button type="button" class="btn btn-danger ms-3" onclick="hapusTinta(${el.id})">${btnHapus}</button></td>
                
              </tr>`;
    });
    out += "</tbody></table>";
    document.querySelector(".cont").innerHTML = out;
  });
  document.querySelector(".btn").innerHTML =
    '<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">Tambah Model Tinta</button>';
}

function tambahTinta() {
  let data = {
    namatinta: document.getElementById("tTinta").value,
    minQ: document.getElementById("tMinQ").value,
    stok: document.getElementById("tStok").value,
  };
  axios.post("http://127.0.0.1:8000/api/V1/tintas", data);
  document.getElementById("tTinta").value = "";
  document.getElementById("tMinQ").value = "";
  document.getElementById("tStok").value = "";
  alert("Tinta Sudah Ditambah");
  tinta();
}

function tampilTinta(id) {
  axios
    .get("http://127.0.0.1:8000/api/V1/tintas/" + id)
    .then(function (response) {
      document.getElementById("idTinta").value = response.data.data.id;
      document.getElementById("tinta").value = response.data.data.namatinta;
      document.getElementById("stok").value = response.data.data.stok;
    });
}

function ubahTinta() {
  let idTinta = document.getElementById("idTinta").value;
  let data = {
    id: idTinta,
    namatinta: document.getElementById("tinta").value,
    stok: document.getElementById("stok").value,
  };
  axios.put("http://127.0.0.1:8000/api/V1/tintas/" + idTinta, data);
  alert("Tinta Berhasil Diubah");
  tinta();
}

function hapusTinta(id) {
  axios.delete("http://127.0.0.1:8000/api/V1/tintas/" + id);
  alert("Berhasil Menghapus Tinta");
  tinta();
}

function pelanggan() {
  axios
    .get("http://127.0.0.1:8000/api/V1/pelanggans")
    .then(function (response) {
      let out =
        "<table class='table'><thead><tr><th scope='col'>No</th><th scope='col'>Nama</th><th scope='col'>Gedung</th><th scope='col'>Area</th><th scope='col'>Departemen</th></tr></thead><tbody>";
      let pelanggan = response.data;
      pelanggan.forEach((el, index) => {
        let number = index + 1;
        out += `<tr>
                  <td>${number}</td>
                  <td>${el.username}</td>
                  <td>${el.gedung}</td>
                  <td>${el.area}</td>
                  <td>${el.departemen}</td>
                </tr>`;
      });
      out += "</tbody></table>";
      document.querySelector(".cont").innerHTML = out;
    });
  document.querySelector(".btn").innerHTML = "<h1> </h1>";
}

function booking() {
  axios.get("http://127.0.0.1:8000/api/V1/bookings").then(function (response) {
    let add;
    let book = response.data;
    let out =
      "<table class='table'><thead><tr><th scope='col'>Nomor Nota</th><th scope='col'>Nama Pelanggan</th><th scope='col'>Nama Printer</th><th scope='col'>Warna Tinta</th><th scope='col'>Nama Tinta</th><th scope='col'>Tanggal Pesan</th></tr></thead><tbody>";
    book.forEach((el) => {
      if (el.tinta === "1") {
        add = `<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal4" onclick="tampilIsiTinta(${el.id})">${btnTambah}</button>`;
      } else {
        add = `${el.tinta}`;
      }
      var tanggal = new Date(el.created_at);
      if (el.status === "1") {
        out += `<tr>
                  <td>${el.id}</td>
                  <td>${el.pelanggan}</td>
                  <td>${el.printer}</td>
                  <td>${el.warna}</td>
                  <td>${add}</td>
                  <td>${tanggal.toLocaleDateString("id-ID")}</td>
                </tr>`;
      }
    });
    out += "</tbody></table>";
    document.querySelector(".cont").innerHTML = out;
  });
  document.querySelector(".btn").innerHTML = "<h1> </h1>";
}

function tampilIsiTinta(nomorNota) {
  document.getElementById("nomorNota").value = nomorNota;
  const selectTinta = document.getElementById("isiTinta");
  axios.get("http://127.0.0.1:8000/api/V1/tintas").then(function (response) {
    let tinta = response.data;
    tinta.forEach((el) => {
      const option = document.createElement("option");
      option.value = el.id;
      option.textContent = el.namatinta;
      selectTinta.appendChild(option);
    });
  });
}

function isiTinta(sel) {
  let nomorNota = document.getElementById("nomorNota").value;
  var sel = document.getElementById("isiTinta");
  let data = {
    tinta: sel.options[sel.selectedIndex].text,
    status: "2",
  };
  axios.put("http://127.0.0.1:8000/api/V1/bookings/" + nomorNota, data);
  let idTinta = document.getElementById("isiTinta").value;
  axios
    .get("http://127.0.0.1:8000/api/V1/tintas/" + idTinta)
    .then(function (response) {
      let stok = response.data.data.stok;
      let stokMin = {
        stok: stok - 1,
      };
      axios
        .put("http://127.0.0.1:8000/api/V1/tintas/" + idTinta, stokMin)
        .then(alert("Tinta berhasil di input"), window.location.reload());
    });
}

function pickup() {
  axios.get("http://127.0.0.1:8000/api/V1/bookings").then(function (response) {
    let pick = response.data;
    let out =
      "<table class='table'><thead><tr><th scope='col'>Nomor Nota</th><th scope='col'>Nama Pelanggan</th><th scope='col'>Nama Printer</th><th scope='col'>Nama Tinta</th><th scope='col'>Warna</th><th scope='col'>Tanggal Pesan</th></tr></thead><tbody>";
    pick.forEach((el) => {
      var tanggal = new Date(el.created_at);
      if (el.status === "2") {
        out += `<tr>
                  <td>${el.id}</td>
                  <td>${el.pelanggan}</td>
                  <td>${el.printer}</td>
                  <td>${el.tinta}</td>
                  <td>${el.warna}</td>
                  <td>${tanggal.toLocaleDateString("id-ID")}</td>
                  <td><button type="button" class="btn btn-success" onclick="statusR(${
                    el.id
                  })">READY</button></td>
                </tr>`;
      }
    });
    out += "</tbody></table>";
    document.querySelector(".cont").innerHTML = out;
  });
  document.querySelector(".btn").innerHTML = "<h1> </h1>";
}

function statusR(idBook) {
  let data = {
    status: "3",
  };
  axios.put("http://127.0.0.1:8000/api/V1/bookings/" + idBook, data);
  alert("Tinta Sudah Diambil");
  pickup();
}

function history() {
  axios.get("http://127.0.0.1:8000/api/V1/bookings").then(function (response) {
    let history = response.data;
    let out =
      "<table class='table'><thead><tr><th scope='col'>Nomor Nota</th><th scope='col'>Nama Pelanggan</th><th scope='col'>Nama Printer</th><th scope='col'>Nama Tinta</th><th scope='col'>Warna</th><th scope='col'>Tanggal Pesan</th><th scope='col'>Tanggal Ambil</th></tr></thead><tbody>";
    history.forEach((el) => {
      var tanggal = new Date(el.created_at);
      var tanggalA = new Date(el.updated_at);
      if (el.status === "3") {
        out += `<tr>
                  <td>${el.id}</td>
                  <td>${el.pelanggan}</td>
                  <td>${el.printer}</td>
                  <td>${el.tinta}</td>
                  <td>${el.warna}</td>
                  <td>${tanggal.toLocaleDateString("id-ID")}</td>
                  <td>${tanggalA.toLocaleDateString("id-ID")}</td>
                </tr>`;
      }
    });
    out += "</tbody></table>";
    document.querySelector(".cont").innerHTML = out;
  });
  document.querySelector(".btn").innerHTML = "<h1> </h1>";
}
