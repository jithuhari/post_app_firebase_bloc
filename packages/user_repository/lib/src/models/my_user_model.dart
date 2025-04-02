import 'package:equatable/equatable.dart';
import '../../user_repository.dart';

class MyUserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;

  const MyUserModel({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
  });

  //Empty user which represents an unauthenticated user
  static const empty = MyUserModel(id: '', email: '', name: '', picture: '');

  //modify MyuserModel parameters

  MyUserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
  }) {
    return MyUserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(id: id, name: name, email: email, picture: picture);
  }

  static MyUserModel fromEntity(MyUserEntity entity) {
    return MyUserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
    );
  }

  //convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == MyUserModel.empty;
  //convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != MyUserModel.empty;

  @override
  List<Object?> get props => [id, name, email, picture];
}
