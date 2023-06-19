import 'package:flutter/material.dart';
import 'package:flutter_books/src/modules/details/details_controller.dart';
import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/models/http/book_api/book_api.dart';

class DetailsPage extends StatefulWidget {
  final SimpleBook book;
  DetailsPage({
    required this.book,
    super.key,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final DetailsController controller = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.init(widget.book);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.details),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text(widget.book.title),
              TextButton(
                onPressed: () => controller.handleFavorite(widget.book),
                child: Observer(
                  builder: (context) => Text(controller.isFavorite
                      ? AppLocalizations.of(context)!.rm
                      : AppLocalizations.of(context)!.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
