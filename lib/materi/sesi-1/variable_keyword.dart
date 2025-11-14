void main() {
  var city = 'Jakarta';
  final country = 'Indonesia';
  const pi = 3.14;
  city = 'Bandung'; // Boleh diubah
  // country = 'Malaysia'; // X Error
  // pi = 3.14159; // X Error
  print('Kota: $city');
  print('Negara: $country');
  print('Pi: $pi');
}
