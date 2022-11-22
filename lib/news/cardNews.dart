import 'package:flutter/material.dart';
import 'package:news_api/news/detailNews.dart';

import '../models/model_news.dart';

class CardNews extends StatelessWidget {
  const CardNews({Key? key, required this.news}) : super(key: key);
  final News news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DetailNews(news: news);
            }),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(news.description),
          ],
        ),
      ),
    );
  }
}
