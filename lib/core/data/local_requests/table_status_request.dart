// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TableStatsRequest {
  final String categoryId;
  final int tableNo;
  final bool status;

  TableStatsRequest(
    this.categoryId,
    this.tableNo,
    this.status,
  );

  TableStatsRequest copyWith({
    String? categoryId,
    int? tableNo,
    bool? status,
  }) {
    return TableStatsRequest(
      categoryId ?? this.categoryId,
      tableNo ?? this.tableNo,
      status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'tableNo': tableNo,
      'status': status,
    };
  }

  factory TableStatsRequest.fromMap(Map<String, dynamic> map) {
    return TableStatsRequest(
      map['categoryId'] as String,
      map['tableNo'] as int,
      map['status'] as bool,
    );
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'categoryId': categoryId,
        'tableNo': tableNo,
        'status': status,
      };

  factory TableStatsRequest.fromJson(String source) =>
      TableStatsRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TableStatsRequest(categoryId: $categoryId, tableNo: $tableNo, status: $status)';

  @override
  bool operator ==(covariant TableStatsRequest other) {
    if (identical(this, other)) return true;

    return other.categoryId == categoryId &&
        other.tableNo == tableNo &&
        other.status == status;
  }

  @override
  int get hashCode => categoryId.hashCode ^ tableNo.hashCode ^ status.hashCode;
}
