import 'package:flutter/foundation.dart';
import 'pagination_state.dart';


typedef PageFetch<T> = Future<List<T>> Function(int page);


class PaginationController<T> extends ChangeNotifier {
  PaginationState<T> _state = PaginationState.initial();
  PaginationState<T> get state => _state;


  final PageFetch<T> onFetch;


  PaginationController({required this.onFetch});


  Future<void> loadNextPage() async {
    if (_state.isLoading || !_state.hasMore) return;


    _state = PaginationState(
      items: _state.items,
      isLoading: true,
      hasMore: _state.hasMore,
      page: _state.page,
    );
    notifyListeners();


    final newItems = await onFetch(_state.page);


    _state = PaginationState(
      items: [..._state.items, ...newItems],
      isLoading: false,
      hasMore: newItems.isNotEmpty,
      page: _state.page + 1,
    );
    notifyListeners();
  }


  void refresh() {
    _state = PaginationState.initial();
    notifyListeners();
    loadNextPage();
  }
}