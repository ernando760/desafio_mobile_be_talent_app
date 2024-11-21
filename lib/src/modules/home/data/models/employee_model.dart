class EmployeeModel {
  final int id;
  final String name;
  final String job;
  final DateTime admissionDate;
  final String phone;
  final String image;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'],
      name: map['name'],
      job: map['job'],
      admissionDate: DateTime.parse(map['admission_date']),
      phone: map['phone'],
      image: map['image'],
    );
  }

  @override
  String toString() =>
      "$runtimeType(id: $id,name: $name,job: $job,adimissionDate: $admissionDate,phone: $phone, image: $image)";
}
