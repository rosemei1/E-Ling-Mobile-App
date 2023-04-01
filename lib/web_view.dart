import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proto/homepage.dart';
import 'package:proto/list_artikel.dart';
import 'package:proto/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  // static const routeName = '/article_web';

  final String url;
  final int id;
  const ArticleWebView({required this.url, required this.id});

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
        elevation: 0,
        title: const Text(
          "Ini judul artikel",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 154, 191, 21),
            fontFamily: "WorkSans",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color.fromARGB(255, 154, 191, 21),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsListPage(id: widget.id)),
            );
          },
        ),
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
