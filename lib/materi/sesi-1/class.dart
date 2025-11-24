void main() {
  var person1 = Person("Riki", 25, 70.0);

  print(person1.name);
  print(person1.weight);

  person1.introduce();
  person1.eat("apple");
  person1.eat("burger");
  print("New weight: ${person1.weight}");
}

class Person {
  String name;
  int? age;
  double weight;

  Person(this.name, this.age, this.weight);

  void introduce() {
    print("Hello, my name is $name and I am $age years old.");
  }

  void eat(String food) {
    print("$name is eating $food.");
    weight += 0.5;
  }
}
