void main() {
  double nilaiSiswa = kalkulasiNilai(
    ipa: 90,
    ips: 85,
    matematika: 35,
  );
  double rataRata = nilaiSiswa / 3;

  /// Tentukan Grade
  String grade = "D";
  if (rataRata >= 90) {
    grade = "A";
  } else if (rataRata >= 80) {
    grade = "B";
  } else if (rataRata >= 70) {
    grade = "C";
  } else {
    grade = "D";
  }

  switch (grade) {
    case "A":
      print("Nilai siswa $rataRata sangat baik dengan grade $grade");
      break;
    case "B":
      print("Nilai siswa $rataRata baik dengan grade $grade");
      break;
    case "C":
      print("Nilai siswa $rataRata cukup dengan grade $grade");
      break;
    default:
      print("Nilai siswa $rataRata kurang dengan grade $grade");
  }
}

double kalkulasiNilai({double? matematika, double? ipa, double? ips}) {
  double result = (matematika ?? 0) + (ipa ?? 0) + (ips ?? 0);
  return result;
}
