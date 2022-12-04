
import 'package:kabarpagi/core/models/api/api_result_model.dart';

class NewsModel extends Serializable {
  NewsSourceModel? source;
  String? author;
  String? title;
  String? description;
  String? urlImage;
  String? publishedAt;
  String? content;
  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.urlImage,
    this.publishedAt,
    this.content
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: json['source'] != null ? NewsSourceModel.fromJson(json['source']) : null,
      title: json['title'].toString().split("-").first,
      description: json['description'] ?? "",
      urlImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
      author: json['author'] ?? "",
    );
  }
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'urlToImage': urlImage,
      'publishedAt': publishedAt,
    };
  }
}

class NewsSourceModel extends Serializable {
  String? id;
  String? name;
  String? country;
  NewsSourceModel({
    this.id,
    this.name,
    this.country,
  });

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) {
    return NewsSourceModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      country: json['country'] ?? "",
    );
  }
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country,
    };
  }
}
