import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JavascriptRuntime jsRuntime = getJavascriptRuntime(forceJavascriptCoreOnAndroid: false);
  @override
  void initState() {
    super.initState();
    initEngine();
  }

  initEngine() async {
    String filterCoreJs = await rootBundle.loadString("assets/js/filter.js");
    jsRuntime.evaluate("""var window = global = globalThis;""");
    jsRuntime.evaluate(filterCoreJs);
    jsRuntime.evaluate("""

console.log(JEELIZFACEFILTERGEN)
""");

    // ÷print(jsResult.stringResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Center'),
      ),
    );
  }
}
