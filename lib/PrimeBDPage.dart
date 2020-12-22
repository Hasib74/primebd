import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimeBd extends StatefulWidget {
  @override
  _PrimeBdState createState() => _PrimeBdState();
}

class _PrimeBdState extends State<PrimeBd> with TickerProviderStateMixin {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();


  bool isLoading = true;

  final spinkit = SpinKitFadingCube(
    color: Color(0xff51BC5D),
    size: 60,

  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Stack(
          children: [
            webView(),
            load(),
          ],
        ),
      ),
    );
  }

  Positioned webView() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: WebView(
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageFinished: (value) {
          print(value);

          setState(() {
            isLoading = false;
          });
        },
        // initialUrl: 'http://5.181.217.155:3006/',
        initialUrl: 'http://primebd.todocoder.com/',
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
      ),
    );
  }

  load() {
    return !isLoading
        ? Container()
        : Align(
            alignment: Alignment.center,
            child: spinkit,
          );
  }
}
