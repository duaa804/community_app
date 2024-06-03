// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DataUser {
  String name;
  String image;
  String message;
  num unread_message_count;
  String date;
  String id;
  DataUser({
    required this.name,
    required this.image,
    required this.message,
    required this.unread_message_count,
    required this.date,
    required this.id,
  });

  DataUser copyWith({
    String? name,
    String? image,
    String? message,
    num? unread_message_count,
    String? date,
    String? id,
  }) {
    return DataUser(
      name: name ?? this.name,
      image: image ?? this.image,
      message: message ?? this.message,
      unread_message_count: unread_message_count ?? this.unread_message_count,
      date: date ?? this.date,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'message': message,
      'unread_message_count': unread_message_count,
      'date': date,
      'id': id,
    };
  }

  factory DataUser.fromMap(Map<String, dynamic> map) {
    return DataUser(
      name: map['name'] as String,
      image: map['image'] as String,
      message: map['message'] as String,
      unread_message_count: map['unread_message_count'] as num,
      date: map['date'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataUser.fromJson(String source) => DataUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DataUser(name: $name, image: $image, message: $message, unread_message_count: $unread_message_count, date: $date, id: $id)';
  }

  @override
  bool operator ==(covariant DataUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image &&
      other.message == message &&
      other.unread_message_count == unread_message_count &&
      other.date == date &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      image.hashCode ^
      message.hashCode ^
      unread_message_count.hashCode ^
      date.hashCode ^
      id.hashCode;
  }
}
