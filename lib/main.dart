import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = WebViewController();

  @override
  void initState() {
    super.initState();
    Future(() async {
      final html = await rootBundle.loadString('assets/twitter.html');
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(
          Uri.dataFromString(
            html,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'),
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
