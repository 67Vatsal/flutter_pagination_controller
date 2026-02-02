import 'package:flutter/material.dart';
import 'pagination_controller.dart';


class PaginationGridView<T> extends StatelessWidget {
  final PaginationController<T> controller;
  final SliverGridDelegate gridDelegate;
  final Widget Function(BuildContext, T) itemBuilder;


  const PaginationGridView({
    super.key,
    required this.controller,
    required this.gridDelegate,
    required this.itemBuilder,
  });


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final state = controller.state;


        return GridView.builder(
          gridDelegate: gridDelegate,
          itemCount: state.items.length + 1,
          itemBuilder: (context, index) {
            if (index < state.items.length) {
              return itemBuilder(context, state.items[index]);
            }


            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
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