import 'package:flutter/material.dart';
import 'package:flutter_books/src/modules/details/details_controller.dart';
import 'package:flutter_books/src/shared/components/book/image_book.dart';
import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/models/http/book_api/book_api.dart';
import '../../shared/services/browser/open_browser.dart';

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
        actions: [
          IconButton(
            onPressed: () => controller.handleFavorite(widget.book),
            icon: Observer(
              builder: (context) => Icon(
                controller.isFavorite
                    ? FontAwesomeIcons.heartCircleCheck
                    : FontAwesomeIcons.heartCirclePlus,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            imageBookWidget,
            Text(
              widget.book.title,
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              widget.book.subtitle,
              style: TextStyle(color: Colors.grey),
            ),
            descriptionWidget,
            Container(
              height: 70,
            )
          ],
        ),
      ),
      floatingActionButton: buttonBuyWidget,
    );
  }

  Widget get imageBookWidget => SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ImageBook(widget.book.image),
        ),
      );

  Widget get descriptionWidget => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          widget.book.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 12),
        ),
      );

  Widget? get buttonBuyWidget => widget.book.buyLink.isNotEmpty
      ? FloatingActionButton(
          child: Icon(FontAwesomeIcons.link),
          onPressed: () => OpenBrowser.open(widget.book.buyLink),
        )
      : null;
}
