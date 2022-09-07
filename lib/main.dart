import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Land Of Restoration Ministry',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if(await _webViewController.canGoBack()){
              _webViewController.goBack();
              return false;
            }else{
              return true;
            }
          },
          child: WebView(
            initialUrl: "http://lrm.rf.gd/",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller){
              _webViewController = controller;
            },
          ),
        ),
      ),
    );
  }
}
