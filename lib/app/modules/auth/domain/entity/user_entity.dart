// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:food_express_app/app/modules/auth/domain/vo/vo_email.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_password.dart';
import 'package:food_express_app/app/modules/auth/domain/vo/vo_text.dart';

class UserEntity {
  final String? id;
  final VoText username;
  final VoEmail email;
  final VoPassword password;

  UserEntity(
      {this.id,
      required this.username,
      required this.email,
      required this.password});

  bool validate() {
    final res = _validateMap.values
        .map((message) => message == null)
        .reduce((value, element) => value == element);
    return res;
  }

  late final _validateMap = {
    "username": username.validate("nome"),
    "email": email.validateEmail("email"),
    "password": password.validatePassword("password")
  };

  UserEntity copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: VoText(username ?? this.username.value),
      email: VoEmail(email ?? this.email.value),
      password: VoPassword(password ?? this.password.value),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username.value,
      'email': email.value,
      'password': password.value,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] != null ? map['id'] as String : null,
      username: VoText(map['username']),
      email: VoEmail(map['email']),
      password: VoPassword(map['password']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      "UserEntity(id:$id,username:${username.value},email:${email.value},password:${password.value})";
}
