import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;
  late WebViewController _rootwebViewController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  MyWebView({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleViewBack(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(title),
        ),
        body: GestureDetector(
          onTap: () {
            FocusNode currentFocus = Focus.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: WebView(
            initialUrl: selectedUrl,
            javascriptMode: JavascriptMode.unrestricted,
            
            onWebViewCreated: (WebViewController webViewController) {
              _controller.future.then(
                (WebViewController value) =>
                    _rootwebViewController = webViewController,
              );
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }

  Future<bool> handleViewBack() async {
    if (await _rootwebViewController.canGoBack()) {
      _rootwebViewController.goBack();
      return false;
    } else {
      return true;
    }
  }
}
