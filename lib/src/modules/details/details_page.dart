import 'package:flutter/material.dart';

import '../../shared/models/dominio/book/book.dart';

class DetailsPage extends StatelessWidget {
  final Book book;
  const DetailsPage({
    required this.book,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(book.volumeInfo.title),
      ),
    );
  }
}
