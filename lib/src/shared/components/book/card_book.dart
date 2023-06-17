import 'package:flutter/material.dart';
import 'package:flutter_books/src/shared/models/dominio/book.dart';

class CardBook extends StatelessWidget {
  final Book book;
  const CardBook(
    this.book, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.id),
    );
  }
}
