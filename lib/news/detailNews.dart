import 'package:flutter/material.dart';
import 'package:news_api/models/news.dart';

class DetailNews extends StatelessWidget {
  final News news;
  const DetailNews({Key? key, required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview News'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                child: Image.network(
                  news.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '${news.title}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(news.content),
              )
            ])),
      ),
    );
  }
}
