// preprosta JS koda - približno znanje 3. letnik
// prikaz tabel in nekaj poizvedb z osnovnimi zankami

// podatki
var Predmet = [
{ idPredmeta: 1, Ime_predmeta: "Slovenščina" },
{ idPredmeta: 2, Ime_predmeta: "VVO" },
{ idPredmeta: 3, Ime_predmeta: "Angleščina" },
{ idPredmeta: 4, Ime_predmeta: "RPR" },
{ idPredmeta: 5, Ime_predmeta: "SMV" }
];

var Ucitelj = [
{ idUčitelja: 1, Ime: "Valentina", Priimek: "Hrastnik" },
{ idUčitelja: 2, Ime: "Borut", Priimek: "Slemenšek" },
{ idUčitelja: 3, Ime: "Rosana", Priimek: "Breznik" },
{ idUčitelja: 4, Ime: "Jaka", Priimek: "Koren" },
{ idUčitelja: 5, Ime: "Boštjan", Priimek: "Resinovič" }
];

var Ucenec = [
{ idUčenca: 1, Ime: "Ana", Priimek: "Kovač" },
{ idUčenca: 2, Ime: "Miha", Priimek: "Novak" },
{ idUčenca: 3, Ime: "Mojca", Priimek: "Podkrižnik" },
{ idUčenca: 4, Ime: "Peter", Priimek: "Malik" },
{ idUčenca: 5, Ime: "Rok", Priimek: "Urni" }
];

var Ucitelj_Predmet = [
{ idUčitelja: 1, idPredmeta: 1 },
{ idUčitelja: 2, idPredmeta: 2 },
{ idUčitelja: 2, idPredmeta: 3 },
{ idUčitelja: 2, idPredmeta: 5 },
{ idUčitelja: 3, idPredmeta: 4 },
{ idUčitelja: 4, idPredmeta: 3 },
{ idUčitelja: 5, idPredmeta: 5 }
];

var Ucenec_Predmet = [
{ idUčenca: 1, idPredmeta: 1 },
{ idUčenca: 1, idPredmeta: 5 },
{ idUčenca: 2, idPredmeta: 1 },
{ idUčenca: 2, idPredmeta: 2 },
{ idUčenca: 2, idPredmeta: 3 },
{ idUčenca: 3, idPredmeta: 1 },
{ idUčenca: 3, idPredmeta: 4 },
{ idUčenca: 4, idPredmeta: 1 },
{ idUčenca: 4, idPredmeta: 3 },
{ idUčenca: 4, idPredmeta: 5 },
{ idUčenca: 5, idPredmeta: 1 },
{ idUčenca: 5, idPredmeta: 3 },
{ idUčenca: 5, idPredmeta: 5 }
];

var Gradivo = [
{ idGradiva: 1, Naslov: "Moderna na Slovenskem", Vsebina: "Wordov dokument s predstavniki in deli", Datum_nalaganja: "2025-04-25", idUčitelja: 1, idPredmeta: 1 },
{ idGradiva: 2, Naslov: "IP naslovi", Vsebina: "PPT datoteka o verzijah IP naslovov", Datum_nalaganja: "2024-09-01", idUčitelja: 2, idPredmeta: 2 },
{ idGradiva: 3, Naslov: "Irregular verbs", Vsebina: "Wordov dokument z nepravilnimi glagoli", Datum_nalaganja: "2020-12-12", idUčitelja: 3, idPredmeta: 3 },
{ idGradiva: 4, Naslov: "Obdelava zvoka", Vsebina: "PPT datoteka z opisom orodja Adobe Audition", Datum_nalaganja: "2024-09-12", idUčitelja: 4, idPredmeta: 4 },
{ idGradiva: 5, Naslov: "Predstavitev WindowsForms", Vsebina: "Videoposnetek z razlago snovi", Datum_nalaganja: "2021-02-05", idUčitelja: 5, idPredmeta: 5 }
];

var Naloga = [
{ idNaloge: 1, Naslov: "Aktualizacija odnosa otroci-starši", Vsebina: "Primerjava današnjih odnosov ...", Datum_oddaje: "2025-09-06", Ocena: 4, idUčenca: 1, idUčitelja: 1, idPredmeta: 1 },
{ idNaloge: 2, Naslov: "Aktualizacija odnosa otroci-starši", Vsebina: "Primerjava današnjih odnosov ...", Datum_oddaje: "2025-09-06", Ocena: 3, idUčenca: 2, idUčitelja: 1, idPredmeta: 1 },
{ idNaloge: 3, Naslov: "Aktualizacija odnosa otroci-starši", Vsebina: "Primerjava današnjih odnosov ...", Datum_oddaje: "2025-09-05", Ocena: 5, idUčenca: 3, idUčitelja: 1, idPredmeta: 1 },
{ idNaloge: 4, Naslov: "Aktualizacija odnosa otroci-starši", Vsebina: "Primerjava današnjih odnosov ...", Datum_oddaje: "2025-09-05", Ocena: 4, idUčenca: 4, idUčitelja: 1, idPredmeta: 1 },
{ idNaloge: 5, Naslov: "Aktualizacija odnosa otroci-starši", Vsebina: "Primerjava današnjih odnosov ...", Datum_oddaje: "2025-09-06", Ocena: 3, idUčenca: 5, idUčitelja: 1, idPredmeta: 1 }
];

// pomožne funkcije (preproste)
function najdiPredmetPoId(id) {
for (var i = 0; i < Predmet.length; i++) {
if (Predmet[i].idPredmeta === id) {
return Predmet[i];
}
}
return null;
}

function najdiUciteljaPoId(id) {
for (var i = 0; i < Ucitelj.length; i++) {
if (Ucitelj[i].idUčitelja === id) {
return Ucitelj[i];
}
}
return null;
}

function najdiUcencePoId(id) {
for (var i = 0; i < Ucenec.length; i++) {
if (Ucenec[i].idUčenca === id) {
return Ucenec[i];
}
}
return null;
}

function renderTable(containerId, columns, rows) {
var container = document.getElementById(containerId);
var table = document.createElement("table");
var thead = document.createElement("thead");
var trHead = document.createElement("tr");
for (var i = 0; i < columns.length; i++) {
var th = document.createElement("th");
th.textContent = columns[i].header;
trHead.appendChild(th);
}
thead.appendChild(trHead);
var tbody = document.createElement("tbody");
for (var r = 0; r < rows.length; r++) {
var tr = document.createElement("tr");
for (var c = 0; c < columns.length; c++) {
var td = document.createElement("td");
var col = columns[c];
if (typeof col.accessor === "function") {
td.textContent = col.accessor(rows[r]);
} else {
td.textContent = rows[r][col.accessor] || "";
}
tr.appendChild(td);
}
tbody.appendChild(tr);
}
table.appendChild(thead);
table.appendChild(tbody);
container.innerHTML = "";
container.appendChild(table);
}

function init() {
// osnovne tabele
renderTable(
"tbl-predmeti",
[
{ header: "ID", accessor: "idPredmeta" },
{ header: "Ime predmeta", accessor: "Ime_predmeta" }
],
Predmet
);

renderTable(
"tbl-ucitelji",
[
{ header: "ID", accessor: "idUčitelja" },
{ header: "Ime", accessor: "Ime" },
{ header: "Priimek", accessor: "Priimek" }
],
Ucitelj
);

renderTable(
"tbl-ucenci",
[
{ header: "ID", accessor: "idUčenca" },
{ header: "Ime", accessor: "Ime" },
{ header: "Priimek", accessor: "Priimek" }
],
Ucenec
);

// gradiva z imeni učiteljev in predmeta
renderTable(
"tbl-gradiva",
[
{ header: "Naslov", accessor: "Naslov" },
{ header: "Vsebina", accessor: "Vsebina" },
{ header: "Datum nalaganja", accessor: "Datum_nalaganja" },
{ header: "Učitelj", accessor: function (row) {
var u = najdiUciteljaPoId(row.idUčitelja);
if (u) {
return u.Ime + " " + u.Priimek;
}
return row.idUčitelja;
} },
{ header: "Predmet", accessor: function (row) {
var p = najdiPredmetPoId(row.idPredmeta);
if (p) {
return p.Ime_predmeta;
}
return row.idPredmeta;
} }
],
Gradivo
);

// naloge z imeni
renderTable(
"tbl-naloge",
[
{ header: "Naslov", accessor: "Naslov" },
{ header: "Datum oddaje", accessor: "Datum_oddaje" },
{ header: "Ocena", accessor: "Ocena" },
{ header: "Učenec", accessor: function (row) {
var u1 = najdiUcencePoId(row.idUčenca);
return u1 ? (u1.Ime + " " + u1.Priimek) : row.idUčenca;
} },
{ header: "Učitelj", accessor: function (row) {
var u2 = najdiUciteljaPoId(row.idUčitelja);
return u2 ? (u2.Ime + " " + u2.Priimek) : row.idUčitelja;
} },
{ header: "Predmet", accessor: function (row) {
var p2 = najdiPredmetPoId(row.idPredmeta);
return p2 ? p2.Ime_predmeta : row.idPredmeta;
} }
],
Naloga
);

// Poizvedbe z osnovnimi zankami (brez filter/map)
// 1) Gradiva za predmet id=1
var gradivaSlo = [];
for (var i = 0; i < Gradivo.length; i++) {
if (Gradivo[i].idPredmeta === 1) {
gradivaSlo.push(Gradivo[i]);
}
}
renderTable(
"q-gradiva-slo",
[
{ header: "Naslov", accessor: "Naslov" },
{ header: "Datum", accessor: "Datum_nalaganja" }
],
gradivaSlo
);

// 2) Naloge (učitelj 1 in predmet 1)
var nalogeValentina = [];
for (var j = 0; j < Naloga.length; j++) {
if (Naloga[j].idUčitelja === 1 && Naloga[j].idPredmeta === 1) {
nalogeValentina.push(Naloga[j]);
}
}
renderTable(
"q-naloge-valentina",
[
{ header: "Naslov", accessor: "Naslov" },
{ header: "Ocena", accessor: "Ocena" }
],
nalogeValentina
);

// 3) Ocene učenke z id=1
var oceneAna = [];
for (var k = 0; k < Naloga.length; k++) {
if (Naloga[k].idUčenca === 1) {
oceneAna.push(Naloga[k]);
}
}
renderTable(
"q-ocene-ana",
[
{ header: "Naslov", accessor: "Naslov" },
{ header: "Ocena", accessor: "Ocena" }
],
oceneAna
);

// 4) Predmeti, ki jih poučuje učitelj 2
var predmetiUcitelj2 = [];
for (var a = 0; a < Ucitelj_Predmet.length; a++) {
if (Ucitelj_Predmet[a].idUčitelja === 2) {
var p3 = najdiPredmetPoId(Ucitelj_Predmet[a].idPredmeta);
if (p3) {
predmetiUcitelj2.push(p3);
}
}
}
renderTable(
"q-predmeti-ucitelj-2",
[
{ header: "Ime predmeta", accessor: "Ime_predmeta" }
],
predmetiUcitelj2
);

// 5) Učenci pri predmetu 5
var ucenciPredmet5 = [];
for (var b = 0; b < Ucenec_Predmet.length; b++) {
if (Ucenec_Predmet[b].idPredmeta === 5) {
var u3 = najdiUcencePoId(Ucenec_Predmet[b].idUčenca);
if (u3) {
ucenciPredmet5.push(u3);
}
}
}
renderTable(
"q-ucenci-predmet-5",
[
{ header: "Ime", accessor: "Ime" },
{ header: "Priimek", accessor: "Priimek" }
],
ucenciPredmet5
);

// 6) Povprečna ocena učitelja 1
var vsota = 0;
var st = 0;
for (var z = 0; z < Naloga.length; z++) {
if (Naloga[z].idUčitelja === 1) {
vsota = vsota + (Naloga[z].Ocena || 0);
st = st + 1;
}
}
var povprecje = 0;
if (st > 0) {
povprecje = vsota / st;
}
var povDiv = document.getElementById("q-povprecna-ocena");
povDiv.textContent = "Povprečna ocena: " + povprecje.toFixed(2);
}

document.addEventListener("DOMContentLoaded", init);
