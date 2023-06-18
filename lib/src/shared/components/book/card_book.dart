import 'package:flutter/material.dart';
import 'package:flutter_books/src/shared/services/browser/open_browser.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/dominio/book/book.dart';

class CardBook extends StatelessWidget {
  final Book book;
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
          child: Image.network(book.volumeInfo.image),
        ),
      ),
      title: Text(book.volumeInfo.title),
      trailing: book?.saleInfo != null && book.saleInfo!.buyLink.isNotEmpty
          ? IconButton(
              onPressed: () => OpenBrowser.open(book.saleInfo!.buyLink),
              icon: Icon(Icons.link),
            )
          : null,
    );
  }
}
