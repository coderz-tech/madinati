import '../entities/pagination_entity.dart';

class PaginationModel extends PaginationEntity {
  PaginationModel({
    required super.hasNextPage,
    required super.availablePages,
    required super.pageSize,
    required super.pageNumber,
    required super.totalCount,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      hasNextPage: json['hasNextPage'] ?? false,
      availablePages: json['availablePages'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pageNumber: json['pageNumber'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
    );
  }
}
