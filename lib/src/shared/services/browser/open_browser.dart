import 'package:flutter_books/src/shared/services/alerts/toast_service.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenBrowser {
  static open(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      ToastService.show('Could not launch $url');
    }
  }
}
