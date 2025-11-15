void main() {
  // Nullable vs non-nullable
  String nonNullable = 'halo';
  String? nullableName; // bisa null

  // aman, non-nullable
  print(nonNullable.length);
  print(nullableName?.length ?? 1000); // aman: jika null -> 0

  // late initialization
  late String config;
  config = 'di-set nanti';
  print(config);

  // Null assertion operator (!) -- berisiko jika salah
  String? maybe;
  maybe = 'ada';
  print(maybe!.length);
  // paksa jadi non-null, akan throw jika maybe = null

  User? user;
  print(user ?? 'Guest'); // jika user null atau name null →> 'Guest'
  print(user?.name ?? 'Guest Name'); // jika user null atau name null →> 'Guest'

  // Assignment with default (??=)
  int? count;
  count ??= 10; // jika count null, set ke 10
  print(count);

  // Fungsi util menggunakan null-safety
  int parseOrZero(String? s) => int.tryParse(s ?? '') ?? 0;

  // Contoh pemanggilan
  print(parseOrZero('123')); // 123
  print(parseOrZero(null)); // 0
}

// Safe access (?.) dan default (??)
class User {
  String? name;
}
