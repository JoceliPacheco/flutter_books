import 'package:flutter/material.dart';
import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';
import 'package:flutter_books/src/shared/services/browser/open_browser.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/http/book_api/book_api.dart';

class CardBook extends StatelessWidget {
  final SimpleBook book;
  const CardBook(
    this.book, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Modular.to.pushNamed(
        '/details',
        arguments: {'book': book},
      ),
      dense: true,
      leading: Container(
        padding: EdgeInsets.all(8),
        width: 60,
        child: Center(
          child: Image.network(book.image),
        ),
      ),
      title: Text(book.title),
      trailing: book.buyLink.isNotEmpty
          ? IconButton(
              onPressed: () => OpenBrowser.open(book.buyLink),
              icon: Icon(Icons.link),
            )
          : null,
    );
  }
}
