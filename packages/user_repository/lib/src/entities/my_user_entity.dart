import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;
  const MyUserEntity({
    required this.email,
    required this.name,
    this.picture,
    required this.id,
  });

  Map<String, Object?> toJson() {
    return {"id": id, "email": email, "name": name, "picture": picture};
  }

  static MyUserEntity fromJson(Map<String, dynamic> json) {
    return MyUserEntity(
      email: json["email"] as String,
      name: json["name"] as String,
      id: json["id"] as String,
      picture: json["picture"] as String?,
    );
  }

  @override
  List<Object?> get props => [id, email, name, picture];

  @override
  String toString() {
    return ''' UserEntity:{
            id:$id
            email:$email
            name:$name
            picture:$picture
            }''';
  }
}
