import 'package:equatable/equatable.dart';

import '../../domain/entities/news.dart';

class NewsModel extends Equatable {
  final String? id;
  final String? createdAt;
  final String? contributorName;
  final String? contributorAvatar;
  final String? title;
  final String? content;
  final String? contentThumbnail;
  final List<String>? slideshow;

  const NewsModel({
    this.id,
    this.createdAt,
    this.contributorName,
    this.contributorAvatar,
    this.title,
    this.content,
    this.contentThumbnail,
    this.slideshow,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      createdAt: json['createdAt'],
      contributorName: json['contributorName'],
      contributorAvatar: json['contributorAvatar'],
      title: json['title'],
      content: json['content'],
      contentThumbnail: json['contentThumbnail'],
      slideshow: json['slideshow'] != null
          ? List<String>.from(json['slideshow'])
          : null,
    );
  }

  News toEntity() => News(
        id: id,
        createdAt: createdAt,
        contributorName: contributorName,
        contributorAvatar: contributorAvatar,
        title: title,
        content: content,
        contentThumbnail: contentThumbnail,
        slideshow: slideshow,
      );

  @override
  List<Object?> get props => [
        id,
        createdAt,
        contributorName,
        contributorAvatar,
        title,
        content,
        contentThumbnail,
        slideshow,
      ];
}
