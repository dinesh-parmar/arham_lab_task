import 'dart:convert';

class ContentHome {
  ContentHome({
    this.status,
    this.videos,
    this.miniCourses,
    this.podcasts,
    this.message,
    this.blogs,
  });

  String? status;
  List<Content>? videos;
  List<Content>? miniCourses;
  List<Content>? podcasts;
  String? message;
  List<Content>? blogs;

  factory ContentHome.fromRawJson(String str) => ContentHome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContentHome.fromJson(Map<String, dynamic> json) => ContentHome(
        status: json["status"],
        videos: List<Content>.from(json["videos"].map((x) => Content.fromJson(x))),
        miniCourses: List<Content>.from(json["mini_courses"].map((x) => Content.fromJson(x))),
        podcasts: List<Content>.from(json["podcasts"].map((x) => Content.fromJson(x))),
        message: json["message"],
        blogs: List<Content>.from(json["blogs"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "videos": List<dynamic>.from(videos?.map((x) => x.toJson()) ?? []),
        "mini_courses": List<dynamic>.from(miniCourses?.map((x) => x.toJson()) ?? []),
        "podcasts": List<dynamic>.from(podcasts?.map((x) => x.toJson()) ?? []),
        "message": message,
        "blogs": List<dynamic>.from(blogs?.map((x) => x.toJson()) ?? []),
      };
}

class Content {
  Content({
    this.id,
    this.title,
    this.category,
    this.published,
    this.publishDate,
    this.publishTime,
    this.author,
    this.thumbnailUrl,
  });

  int? id;
  String? title;
  String? category;
  bool? published;
  String? publishDate;
  String? publishTime;
  String? author;
  String? thumbnailUrl;

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        published: json["published"],
        publishDate: json["publish_date"],
        publishTime: json["publish_time"],
        author: json["author"],
        thumbnailUrl: json["thumbnail_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "published": published,
        "publish_date": publishDate,
        "publish_time": publishTime,
        "author": author,
        "thumbnail_url": thumbnailUrl,
      };
}
