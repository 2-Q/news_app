class News {
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  News(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'] ?? 'Load data filed',
        description: json['description'] ?? 'Load data filed',
        url: json['url'] ?? 'Load data filed',
        urlToImage: json['urlToImage'] ?? 'Load data filed',
        publishedAt: json['publishedAt'] ?? 'Load data filed',
        content: json['content'] ?? 'Filed on loaded content');
  }
}
