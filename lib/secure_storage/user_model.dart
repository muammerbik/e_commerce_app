import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String userId;
  String email;
  String? userName;

  UserModel({
    required this.userId,
    required this.email,
    this.userName,
  });
  
  @override
  List<Object?> get props => [userId, email, userName];

  UserModel copyWith({
    String? userId,
    String? email,
    String? userName,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'userName': userName ?? email.substring(0, email.indexOf("@")),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      email: map['email'] as String,
      userName: map['userName'] as String?,
    );
  }
}
