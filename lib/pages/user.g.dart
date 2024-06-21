// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      password: json['password'] as String,
      bmiRecords: (json['bmiRecords'] as List<dynamic>?)
              ?.map((e) => BMIRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'bmiRecords': instance.bmiRecords,
    };

BMIRecord _$BMIRecordFromJson(Map<String, dynamic> json) => BMIRecord(
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      age: (json['age'] as num).toInt(),
      bmi: (json['bmi'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$BMIRecordToJson(BMIRecord instance) => <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'age': instance.age,
      'bmi': instance.bmi,
      'date': instance.date,
    };
