## Flutter Pagination Controller

A lightweight and reusable **pagination controller** for Flutter that supports  
**ListView** and **GridView** with infinite scrolling.

Designed to keep pagination logic **clean, simple, and reusable** across apps.

---

## ✨ Features

- 🔁 Page-based pagination
- 📃 ListView pagination
- 🟦 GridView pagination
- 🧠 Separate pagination controller
- ⏳ Built-in loading indicator
- 🔄 Refresh support
- 🧪 Easy API integration
- 📦 Clean & minimal public API

---

## Preview

![Screenshot_20260202_122637](https://github.com/user-attachments/assets/21fe68c6-8c07-4772-a168-7a0b34c94607)



## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_pagination_controller: ^1.0.0
```
Then run:
```
flutter pub get
```
## 🧠 Pagination Controller
```
final controller = PaginationController<Item>(
  onFetch: (page) async {
    return fetchItemsFromApi(page);
  },
);
```
📃 ListView Pagination Example
```
PaginationListView<Item>(
  controller: controller,
  itemBuilder: (context, item) {
    return ListTile(
      title: Text(item.title),
    );
  },
)
```
## 🟦 GridView Pagination Example
```
PaginationGridView<Item>(
  controller: controller,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
  ),
  itemBuilder: (context, item) {
    return Card(
      child: Center(child: Text(item.title)),
    );
  },
)
```
## 🧪 Example API Function
```
Future<List<int>> fetchItemsFromApi(int page) async {
  await Future.delayed(const Duration(seconds: 1));
  return List.generate(10, (i) => (page - 1) * 10 + i);
}
```
## 📄 License
```
MIT License

Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
