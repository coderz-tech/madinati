class PaginationEntity {
  final bool hasNextPage;
  final int availablePages;
  final int pageSize;
  final int pageNumber;
  final int totalCount;

  PaginationEntity({
    required this.hasNextPage,
    required this.availablePages,
    required this.pageSize,
    required this.pageNumber,
    required this.totalCount,
  });
}
