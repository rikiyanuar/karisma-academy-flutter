void main() {
  List<String> nama = ["Riki", "Ana", "Budi"];

  nama.add("Siti");

  print(nama);

  nama.remove("Ana");

  print(nama);

  int index = nama.indexOf("Budi");

  print("Index Budi: $index");

  List dataDinamis = [100, "Riki", true, 75.5];

  dataDinamis.insert(2, "Dewi");

  print(dataDinamis);

  dataDinamis.removeWhere((element) {
    return element == "Riki";
  });

  print(dataDinamis);

  print(dataDinamis.where((element) => element == 75.5));

  for (var i = 0; i < nama.length; i++) {
    print(nama[i]);
  }

  var result = nama.map((e) => "Nama: $e").toList();

  print(result);
}
