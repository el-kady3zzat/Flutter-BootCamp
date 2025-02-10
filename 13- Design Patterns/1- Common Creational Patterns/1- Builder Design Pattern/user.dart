// User class that has multiple attributes like First name, Last name, age, phone
class User {
  final String firstName;
  final String lastName;
  final int? age;
  final String? phone;

  User._({
    required this.firstName,
    required this.lastName,
    this.age,
    this.phone,
  });
}

// use UserBuilder to set this data
class UserBuilder {
  String firstName;
  String lastName;
  int? age;
  String? phone;

  UserBuilder(this.firstName, this.lastName);

  UserBuilder setAge(int age) {
    this.age = age;
    return this;
  }

  UserBuilder setPhone(String phone) {
    this.phone = phone;
    return this;
  }

// use the build function to create an instance with the data
  User build() {
    return User._(
      firstName: firstName,
      lastName: lastName,
      age: age,
      phone: phone,
    );
  }
}
