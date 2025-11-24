void main() {
  List nilai = [80, 90, 75];

  // for (var i = 0; i < 3; i++) {
  //   print(nilai[]);
  // }

  for (var i = 0; i < nilai.length; i++) {
    int result = nilai[i] * 2;
    print(result);
  }

  /// Infinite loop
  int i = 0;
  while (true) {
    print('$i');
    i++;
  }

  /// Infinite loop
  // for (var i = 0; true; i++) {
  //   if (i == 10) {
  //     break;
  //   }
  //   print(i);
  // }
  // print("Selesai Looping");
}
