import 'package:flutter/material.dart';
import 'package:flutter_books/src/modules/details/details_controller.dart';
import 'package:flutter_books/src/shared/components/book/image_book.dart';
import 'package:flutter_books/src/shared/models/dominio/book/simple_book.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/services/browser/open_browser.dart';

class DetailsPage extends StatefulWidget {
  final SimpleBook book;
  const DetailsPage({
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
    super.initState();
    controller.init(widget.book);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white),
        child: ListView(
          shrinkWrap: true,
          children: [
            imageBookWidget,
            Text(
              widget.book.title,
              style: const TextStyle(color: Colors.blueGrey),
            ),
            Text(
              widget.book.subtitle,
              style: const TextStyle(color: Colors.grey),
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

  Widget get descriptionWidget => Text(
        widget.book.description,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 12),
      );

  Widget? get buttonBuyWidget => widget.book.buyLink.isNotEmpty
      ? FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: const Icon(FontAwesomeIcons.cartShopping),
          onPressed: () => OpenBrowser.open(widget.book.buyLink),
        )
      : null;
}
