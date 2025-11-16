void main() {
  List nilai = [
    80,
    90,
    75,
    85,
    95,
    80,
    90,
    75,
    85,
    95,
    80,
    90,
    75,
    85,
    95,
    80,
    90,
    75,
    85,
    95
  ];

  for (var i = 0; i < nilai.length; i++) {
    int result = nilai[i] * 2;
    print(result);
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
