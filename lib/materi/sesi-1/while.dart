void main() {
  List nilai = [
    80,
    90,
    75,
  ];

  int i = 0;
  while (i < nilai.length) {
    int result = nilai[i] * 2;
    print(result);
    i++;
  }

  i = 0;
  do {
    int result = nilai[i] * 2;
    print(result);
    i++;
  } while (i < nilai.length);

  /// Infinite loop
  int j = 0;
  while (true) {
    if (j == 10) {
      break;
    }
    print(j);
    j++;
  }
  print("Selesai Looping");

  int k = 1;
  while (k <= 10) {
    if (k % 2 == 0) {
      k++;
      continue;
    }
    print(k);
    k++;
  }
}
