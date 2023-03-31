import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proto/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  static const routeName = '/article_web';

  final String url;
  const ArticleWebView({required this.url});

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  late WebViewController webViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
        onWebViewCreated: (controller) => webViewController = controller,
        onPageStarted: (url) {
          webViewController.runJavascript(
              "document.getElementsByTagName('mw-header')[0].style.display='none'");
          webViewController.runJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          webViewController.runJavascript(
              "document.getElementsByTagName('section')[1].style.display='none'");
        },
      ),
    );
  }
}
