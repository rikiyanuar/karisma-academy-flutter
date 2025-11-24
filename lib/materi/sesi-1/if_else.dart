void main() {
  double nilaiSiswa = kalkulasiNilai(
    ips: 85,
    ipa: 90,
    matematika: 95,
  );
  double rataRata = nilaiSiswa / 3;

  if (rataRata / 3 >= 90) {
    print("Nilai siswa $rataRata sangat baik");
  } else {
    print("Nilai siswa $rataRata kurang baik");
  }

  User user = User();
  if (user.name != null) {
    if (user.name?.toLowerCase() == "riki") {
      print("Anda memiliki akses");
    } else {
      print("Anda tidak memiliki akses");
    }
  } else {
    print('Hello, Guest From Name');
  }
}

double kalkulasiNilai({double? matematika, double? ipa, double? ips}) {
  double result = (matematika ?? 0) + (ipa ?? 0) + (ips ?? 0);
  return result;
}

class User {
  String? name = 'Riki';
}
