int add(int a, int b) {
  return a + b;
}

String greet(String name, [String? title]) {
  if (title != null) {
    return 'Hello, $title $name';
  } else {
    return 'Hello, $name';
  }
}

void main() {
  // Memanggil fungsi ADD
  int result = add(5, 7);
  print('Hasil penjumlahan: $result');

  // Memanggil fungsi GREET tanpa title
  String greeting1 = greet('Alice');
  print(greeting1);

  // Memanggil fungsi GREET dengan title
  String greeting2 = greet('Bob', 'Mr.');
  print(greeting2);
}
