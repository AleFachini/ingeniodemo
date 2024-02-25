class Employee {
  final String avatar;
  final String bio;
  final String firstName;
  final String id;
  final String lastName;
  final String title;

  Employee({
    required this.avatar,
    required this.bio,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.title,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      avatar: json['avatar'],
      bio: json['bio'],
      firstName: json['firstName'],
      id: json['id'],
      lastName: json['lastName'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['bio'] = bio;
    data['firstName'] = firstName;
    data['id'] = id;
    data['lastName'] = lastName;
    data['title'] = title;
    return data;
  }
}
