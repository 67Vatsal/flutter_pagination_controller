import 'package:flutter/material.dart';
import 'pagination_controller.dart';


class PaginationListView<T> extends StatelessWidget {
  final PaginationController<T> controller;
  final Widget Function(BuildContext, T) itemBuilder;


  const PaginationListView({
    super.key,
    required this.controller,
    required this.itemBuilder,
  });


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final state = controller.state;


        return ListView.builder(
          itemCount: state.items.length + 1,
          itemBuilder: (context, index) {
            if (index < state.items.length) {
              return itemBuilder(context, state.items[index]);
            }


            if (state.isLoading) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }


            if (state.hasMore) {
              controller.loadNextPage();
            }


            return const SizedBox();
          },
        );
      },
    );
  }
}