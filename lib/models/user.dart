class User {
  String username, fullname, phoneNumber, email;
  String avatar;
  String role;
  String createdAt, updatedAt;

  User(
      {this.username,
      this.fullname,
      this.phoneNumber,
      this.email,
      this.avatar,
      this.role,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(dynamic json) {
    return User(
        fullname: json['fullname'] as String,
        username: json['username'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        role: json['role'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String);
  }
}

Future<List<User>> fetchUsers() async {
  User user = User(
    username: 'SpacePotato',
    fullname: 'Nguyen Tuan A',
    phoneNumber: '0123456789',
    email: 'space@potato.com',
    role: 'Manager',
  );

  User user2 = User(
      username: 'Mitsuki',
      fullname: 'Nguyen Phuong A',
      phoneNumber: '0987654321',
      email: 'mitsuki@example.com',
      role: 'Manager');

  User user3 = User(
      username: 'potato',
      fullname: 'Potato Fullname',
      phoneNumber: '0654987321',
      email: 'potato@example.com',
      role: 'Admin');

  User user4 = User(
      username: 'Potato1234',
      fullname: '1234 Fullname',
      phoneNumber: '13456789',
      email: 'potato@1234.com',
      role: 'Employee');
  User user5 = User(
      username: 'Potato1234',
      fullname: '1234 Fullname',
      phoneNumber: '13456789',
      email: 'potato@1234.com',
      role: 'Employee');
  List<User> list = List();
  list.add(user);
  list.add(user2);
  list.add(user3);
  list.add(user4);
  list.add(user5);
  list.add(user4);
  list.add(user4);
  return list;
}
