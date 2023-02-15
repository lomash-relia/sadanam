import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppMaps extends StatefulWidget {
  const InAppMaps({Key? key}) : super(key: key);

  @override
  State<InAppMaps> createState() => _InAppMapsState();
}

class _InAppMapsState extends State<InAppMaps> {
  double _progress = 0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.turn_left_rounded),
          ),
          toolbarHeight: 35,
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      'https://www.google.com/maps/place/Budget+Inn+Bellevue/@21.2022228,72.8351947,15z/data=!4m9!3m8!1s0x3be04efa789d7d95:0xa8065b3a1e644edc!5m2!4m1!1i2!8m2!3d21.2088731!4d72.8397687!16s%2Fg%2F1td1zqlw?coh=164777&entry=tt')),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress = _progress / 100;
                });
              },
            ),
            _progress < 1
                ? SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                      value: _progress,
                      color: Colors.greenAccent,
                    ),
                  )
                : SizedBox(
                    height: 3,
                  ),
          ],
        ),
      ),
    );
  }
}
