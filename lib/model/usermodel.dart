class Usermodel {
  String? name;
  String? age;
  String? bloodGroup;
  String? place;
  String? image;
  String? phoneNumber;

  Usermodel(
      {required this.name,
      required this.age,
      required this.bloodGroup,
      required this.phoneNumber,
      required this.place,
      required this.image});

  factory Usermodel.fromBase(Map<String, dynamic> base) {
    return Usermodel(
        name: base['name'],
        age: base['age'],
        bloodGroup: base['bloodGroup'],
        phoneNumber: base['phoneNumber'],
        place: base['place'],
        image: base['image']);
  }

  Map<String, dynamic> toBase() {
    return {
      'name': name,
      'age': age,
      'bloodGroup': bloodGroup,
      'phoneNumber': phoneNumber,
      'place': place,
      'image': image
    };
  }
}
