import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NounPortalView extends StatefulWidget {
  const NounPortalView({Key? key}) : super(key: key);

  @override
  State<NounPortalView> createState() => _NounPortalViewState();
}

class _NounPortalViewState extends State<NounPortalView> {
  late WebViewController webview;

  late final WebViewController controller;

  bool isLoading=true;

  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setNavigationDelegate(NavigationDelegate(

      onPageStarted: (url) {
        setState(() {
          isLoading = true;
        });

      },
      onProgress: (progress) {
        setState(() {
          isLoading = true;
        });

      },
      onPageFinished: (url) {
        setState(() {
          isLoading = false;
        });

      },
    ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://elearn.nouedu2.net/'));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Flutter WebView Example'),
        // ),
        body: Stack(
          children: [
            isLoading == true ? const Center(child: CircularProgressIndicator()) :
            WebViewWidget(
              gestureRecognizers: gestureRecognizers,
                controller: controller)
          ],
        )
    );
  }
}


