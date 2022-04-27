part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });
  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      address: data['address'],
      houseNumber: data['houseNumber'],
      phoneNumber: data['poneNumber'],
      city: data['city'],
      picturePath: data["profile_photo_url"]);

  User copyWith(
          {int id,
          String name,
          String email,
          String address,
          String houseNumber,
          String phoneNumber,
          String city,
          String picturePath}) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          city: city ?? this.city,
          picturePath: picturePath ?? this.picturePath);

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
    id: 1,
    name: "Akar Bondan Permana",
    email: "akbarbondan96@gmail.com",
    address: "bantul karang jambe",
    houseNumber: "08",
    phoneNumber: "030482928490932",
    city: "Yogyakarata",
    picturePath:
        "https://2.bp.blogspot.com/-AkJ58qAhMQ4/W4U6LeuK53I/AAAAAAAADsI/VK5mxyDzYbMqfW22pnoi9Cs-s1oVIo19ACLcBGAs/s320/Untitled-1-Recovered.jpg");
