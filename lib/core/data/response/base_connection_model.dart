// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class BaseConnectionModel<T> {
  String type;
  String senderID;

  String? data;
  BaseConnectionModel({
    required this.type,
    required this.senderID,
     this.data,
  });

 

  BaseConnectionModel<T> copyWith({
    String? type,
    String? senderID,
    String? data,
  }) {
    return BaseConnectionModel<T>(
      type: type ?? this.type,
      senderID: senderID ?? this.senderID,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'senderID': senderID,
      'data': data,
    };
  }

  factory BaseConnectionModel.fromMap(Map<String, dynamic> map) {
    return BaseConnectionModel<T>(
      type: map['type'] as String,
      senderID: map['senderID'] as String,
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseConnectionModel.fromJson(String source) => BaseConnectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BaseConnectionModel(type: $type, senderID: $senderID, data: $data)';

  @override
  bool operator ==(covariant BaseConnectionModel<T> other) {
    if (identical(this, other)) return true;
  
    return 
      other.type == type &&
      other.senderID == senderID &&
      other.data == data;
  }

  @override
  int get hashCode => type.hashCode ^ senderID.hashCode ^ data.hashCode;
}
