import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLive = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !showLive
        ? Center(
            child: ElevatedButton(
                onPressed: () {
                  showLive = true;
                  setState(() {});
                },
                child: Text('Open filter')),
          )
        : SafeArea(
            child: Scaffold(
              body: InAppWebView(
                onConsoleMessage: (c, console) {
                  print(console.message);
                },
                onPermissionRequest: (controller, request) async {
                  return PermissionResponse(resources: request.resources, action: PermissionResponseAction.GRANT);
                },
                initialSettings: InAppWebViewSettings(
                  mediaPlaybackRequiresUserGesture: false,
                  allowsInlineMediaPlayback: true,
                ),
                initialUrlRequest: URLRequest(url: WebUri('https://jeeliz.com/demos/faceFilter/demos/threejs/dog_face/')),
              ),
            ),
          );
  }
}
