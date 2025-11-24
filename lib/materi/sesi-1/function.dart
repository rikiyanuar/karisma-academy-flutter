int add(int a, int b) {
  return (a + b) * 2;
}

num divide(num a, num b) {
  return a / b;
}

num kali(num a, num b) {
  return a * b;
}

String greet(String name, [String? title]) {
  if (title != null) {
    return 'Hello, $title $name';
  } else {
    return 'Hello, $name';
  }
}

String greet2(String name, {String? title, int? age}) {
  if (title != null) {
    return 'Hello, $title $name, age $age';
  } else {
    return 'Hello, $name, age $age';
  }
}

void main() {
  // Memanggil fungsi ADD
  num result = add(5, 100);
  print('Hasil penjumlahan: $result');

  // num resultNum = divide(9, 3);
  // print('Hasil pembagian: $resultNum');

  // Memanggil fungsi GREET tanpa title
  String greeting1 = greet('Alice');
  print(greeting1);

  // Memanggil fungsi GREET dengan title
  String greeting2 = greet('Bob', 'Mr.');
  print(greeting2);

  String greeting3 = greet2('Bob', title: 'Sir', age: 30);
  print(greeting3);
}
