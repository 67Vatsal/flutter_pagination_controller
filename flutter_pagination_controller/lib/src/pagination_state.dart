class PaginationState<T> {
  final List<T> items;
  final bool isLoading;
  final bool hasMore;
  final int page;


  PaginationState({
    required this.items,
    required this.isLoading,
    required this.hasMore,
    required this.page,
  });


  factory PaginationState.initial() {
    return PaginationState(
      items: [],
      isLoading: false,
      hasMore: true,
      page: 1,
    );
  }
}