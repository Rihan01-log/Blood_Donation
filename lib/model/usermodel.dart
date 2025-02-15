class Usermodel {
  int?id;
  String? name;
  String? age;
  String? bloodGroup;
  String? place;
  String? image;
  String? phoneNumber;

  Usermodel(
      {this.id,required this.name,
      required this.age,
      required this.bloodGroup,
      required this.phoneNumber,
      required this.place,
      this.image});

  factory Usermodel.fromBase(Map<String, dynamic> base) {
    return Usermodel(
        id: base['id'],
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
