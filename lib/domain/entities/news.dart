import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String? id;
  final String? createdAt;
  final String? contributorName;
  final String? contributorAvatar;
  final String? title;
  final String? content;
  final String? contentThumbnail;
  final List<String>? slideshow;

  const News({
    this.id,
    this.createdAt,
    this.contributorName,
    this.contributorAvatar,
    this.title,
    this.content,
    this.contentThumbnail,
    this.slideshow,
  });

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
