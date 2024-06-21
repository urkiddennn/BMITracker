import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String password;
  List<BMIRecord> bmiRecords;

  User({
    required this.username,
    required this.password,
    required this.bmiRecords,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var list = json['bmiRecords'] as List;
    List<BMIRecord> bmiRecordsList =
        list.map((i) => BMIRecord.fromJson(i)).toList();

    return User(
      username: json['username'],
      password: json['password'],
      bmiRecords: bmiRecordsList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> bmiRecordsList =
        this.bmiRecords.map((i) => i.toJson()).toList();

    return {
      'username': username,
      'password': password,
      'bmiRecords': bmiRecordsList,
    };
  }
}

@JsonSerializable()
class BMIRecord {
  double weight;
  double height;
  double bmi;
  String date;
  int age;

  BMIRecord({
    required this.weight,
    required this.height,
    required this.bmi,
    required this.date,
    required this.age,
  });

  factory BMIRecord.fromJson(Map<String, dynamic> json) {
    return BMIRecord(
      weight: json['weight'],
      height: json['height'],
      bmi: json['bmi'],
      date: json['date'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'date': date,
      'age': age,
    };
  }
}
