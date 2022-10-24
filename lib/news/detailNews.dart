import 'package:flutter/material.dart';
import 'package:news_api/models/news.dart';

class DetailNews extends StatelessWidget {
  // DetailNews({Key? key, required Newss news}) : super(key: key);

  final News news;
  const DetailNews({Key? key, required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'title: ${news.title}',
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Body: '),
        Text(news.description)
      ])),
    );
  }
}
