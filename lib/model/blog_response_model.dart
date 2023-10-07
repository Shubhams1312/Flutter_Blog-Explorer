// To parse this JSON data, do
//
//     final blogRequest = blogRequestFromJson(jsonString);

import 'dart:convert';

BlogResponseModel blogRequestFromJson(String str) => BlogResponseModel.fromJson(json.decode(str));

String blogRequestToJson(BlogResponseModel data) => json.encode(data.toJson());

class BlogResponseModel {
    List<Blog> blogs;

    BlogResponseModel({
        required this.blogs,
    });

    factory BlogResponseModel.fromJson(Map<String, dynamic> json) => BlogResponseModel(
        blogs: List<Blog>.from(json["blogs"].map((x) => Blog.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "blogs": List<dynamic>.from(blogs.map((x) => x.toJson())),
    };
}

class Blog {
    String id;
    String imageUrl;
    String title;
    bool fav = false;

    Blog({
        required this.id,
        required this.imageUrl,
        required this.title,
    });

    factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        imageUrl: json["image_url"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "title": title,
    };
}
