import 'package:flutter/material.dart';
import 'package:flutter_books/src/modules/details/details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/models/dominio/book/book.dart';

class DetailsPage extends StatelessWidget {
  final DetailsController controller = Modular.get();

  final Book book;
  DetailsPage({
    required this.book,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Text(book.volumeInfo.title),
            TextButton(
              onPressed: () => controller.add(book),
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
