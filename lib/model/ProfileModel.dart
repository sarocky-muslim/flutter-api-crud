class ProfileModel {
  String? name;
  int? age;
  Map<String, dynamic>? image;

  ProfileModel({this.name, this.age, this.image});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      ProfileModel(name: json["name"], age: json["age"], image: json["image"]);

  Map<String, dynamic> toJson() => {"name": name, "age": age, "image": image};
}
