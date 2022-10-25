import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/models/news.dart';
import 'dart:async';
import 'dart:convert';

import 'package:news_api/news/cardNews.dart';

class IndexNews extends StatefulWidget {
  IndexNews({Key? key}) : super(key: key);

  @override
  State<IndexNews> createState() => _IndexNewsState();
}

class _IndexNewsState extends State<IndexNews> {
  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=44b96540231347a4a8be76d06fc900d9&pageSize=10&page=1'));

    if (response.statusCode == 200) {
      var getNewsData = json.decode(response.body)['articles'] as List;
      print(getNewsData);
      var listNews = getNewsData.map((i) => News.fromJson(i)).toList();
      return listNews;
    } else {
      throw Exception('Failed to load News');
    }
  }

  late Future<List<News>> futureNews;

  @override
  void initState() {
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today News'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: FutureBuilder<List<News>>(
              future: futureNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        var post = (snapshot.data as List<News>)[index];
                        return Column(
                          children: [
                            CardNews(
                              news: News(
                                  title: post.title,
                                  description: post.description,
                                  url: post.url,
                                  urlToImage: post.urlToImage,
                                  publishedAt: post.publishedAt,
                                  content: post.content),
                            ),
                            SizedBox(height: 10)
                          ],
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: (snapshot.data as List<News>).length);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
