class UserModel {
  int? id;
  String? name;
  int? age;
  bool? married;
  List<String>? skills;
  UniversityModel? university;

  UserModel({
    this.id,
    this.name,
    this.age,
    this.married,
    this.skills,
    this.university,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        married: json["married"],
        skills: List<String>.from(json["skills"]),
        university: UniversityModel.fromJson(json["university"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "married": married,
        "skills": skills,
        "university": university?.toJson(),
      };
}

class UniversityModel {
  String? name;
  String? address;

  UniversityModel({
    this.name,
    this.address,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
      };
}
