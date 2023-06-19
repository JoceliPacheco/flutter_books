import 'package:flutter/material.dart';
import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';
import 'package:flutter_books/src/shared/services/browser/open_browser.dart';

import 'image_book.dart';

class CardBook extends StatelessWidget {
  final SimpleBook book;
  final Function onTap;

  const CardBook(
    this.book, {
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 224, 224, 224),
      child: ListTile(
        onTap: () => onTap(),
        dense: true,
        leading: Container(
          padding: const EdgeInsets.all(8),
          width: 60,
          child: Center(
            child: ImageBook(book.image),
          ),
        ),
        title: Text(book.title),
        trailing: book.buyLink.isNotEmpty
            ? IconButton(
                onPressed: () => OpenBrowser.open(book.buyLink),
                icon: const Icon(Icons.link),
              )
            : null,
      ),
    );
  }
}
