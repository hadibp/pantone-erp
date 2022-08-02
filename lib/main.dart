import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'no_internet.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return WebViewExample();
  }
}

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  late final WebResourceErrorCallback? onWebResourceError;
  bool hasError = false;
  List<WebViewCookie> initialCookies = const <WebViewCookie>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/home': (context) => WebViewExample()},
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: !hasError
              ? WebView(
                  initialUrl: 'https://pantoneerp.herokuapp.com',
                  initialCookies: initialCookies,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebResourceError: (onWebResourceError) {
                    if (onWebResourceError.errorType ==
                        WebResourceErrorType.hostLookup) {
                      setState(() {
                        hasError = true;
                      });
                    }
                  },
                )
              : NoInternet(),
        ),
      ),
    );
  }
}
