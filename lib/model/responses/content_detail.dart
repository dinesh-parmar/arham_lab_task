import 'dart:convert';

class ContentDetail {
  ContentDetail({
    this.status,
    this.blogDetail,
    this.message,
  });

  String? status;
  BlogDetail? blogDetail;
  String? message;

  factory ContentDetail.fromRawJson(String str) => ContentDetail.fromJson(json.decode(str));

  factory ContentDetail.fromJson(Map<String, dynamic> json) => ContentDetail(
        status: json["status"],
        blogDetail: BlogDetail.fromJson(json["blog_detail"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "blog_detail": blogDetail?.toJson(),
        "message": message,
      };
}

class BlogDetail {
  BlogDetail({
    this.id,
    this.title,
    this.blogContent,
    this.published,
    this.publishDate,
    this.publishTime,
    this.category,
    this.contentType,
    this.media,
  });

  int? id;
  String? title;
  String? blogContent;
  bool? published;
  String? publishDate;
  String? publishTime;
  String? category;
  String? contentType;
  Media? media;

  factory BlogDetail.fromRawJson(String str) => BlogDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogDetail.fromJson(Map<String, dynamic> json) => BlogDetail(
        id: json["id"],
        title: json["title"],
        blogContent: json["blog_content"],
        published: json["published"],
        publishDate: json["publish_date"],
        publishTime: json["publish_time"],
        category: json["category"],
        contentType: json["content_type"],
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "blog_content": blogContent,
        "published": published,
        "publish_date": publishDate,
        "publish_time": publishTime,
        "category": category,
        "content_type": contentType,
        "media": media?.toJson(),
      };
}

class Media {
  Media({
    this.mediaType,
    this.isCoverMedia,
    this.url,
    this.thumbnailUrl,
  });

  int? mediaType;
  bool? isCoverMedia;
  String? url;
  String? thumbnailUrl;

  factory Media.fromRawJson(String str) => Media.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        mediaType: json["media_type"],
        isCoverMedia: json["is_cover_media"],
        url: json["url"],
        thumbnailUrl: json["thumbnail_url"],
      );

  Map<String, dynamic> toJson() => {
        "media_type": mediaType,
        "is_cover_media": isCoverMedia,
        "url": url,
        "thumbnail_url": thumbnailUrl,
      };
}
