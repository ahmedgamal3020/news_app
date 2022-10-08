
import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
  final String? url;
  const WebViewScreen({Key? key,this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
    );
  }
}
