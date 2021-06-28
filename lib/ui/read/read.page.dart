import 'package:flutter/material.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadPage extends StatefulWidget {
  final NewsEntity newsEntity;
  const ReadPage({Key? key, required this.newsEntity}) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.newsEntity.title.toString())),
      body: widget.newsEntity.url == null
          ? Center(
              child: Text("Wrong link"),
            )
          : WebView(
              initialUrl: widget.newsEntity.url,
            ),
    );
  }
}
