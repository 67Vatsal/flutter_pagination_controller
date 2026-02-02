import 'package:flutter/material.dart';
import 'package:flutter_pagination_controller/flutter_pagination_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage(),debugShowCheckedModeBanner: false,);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PaginationController<int> controller;

  @override
  void initState() {
    super.initState();
    controller = PaginationController<int>(
      onFetch: (page) async {
        await Future.delayed(const Duration(seconds: 1));
        return List.generate(20, (i) => (page - 1) * 20 + i);
      },
    )..loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagination Demo'),centerTitle: true,backgroundColor: Colors.blue,),
      body: PaginationGridView<int>(
        controller: controller,
        itemBuilder: (_, item) => ListTile(title: Text('Item $item')),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
      ),
    );
  }
}
