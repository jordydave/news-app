import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/domain/entities/news.dart';
import 'package:technical_test/presentation/pages/photo_view_page.dart';
import 'package:technical_test/utils/date_format.dart';
import 'package:technical_test/utils/string_ext.dart';

import '../../utils/colors.dart';

class NewsDetailPage extends StatelessWidget {
  static const routeName = '/detail';

  final News? news;
  const NewsDetailPage({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news?.title?.capitalize() ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news?.title?.capitalize() ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "By ${news?.contributorName}",
                style: const TextStyle(
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                formatterDate.format(
                  DateTime.parse(news?.createdAt ?? ""),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                height: 200,
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhotoViewPage(
                          url: news!.contentThumbnail!,
                          tag: news!.contentThumbnail!,
                        ),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: news?.contentThumbnail ?? '',
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              news!.slideshow!.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: double.infinity,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: news?.slideshow?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PhotoViewPage(
                                        url: news!.slideshow![index],
                                        tag: news!.slideshow![index],
                                      ),
                                    ),
                                  );
                                },
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: news?.slideshow![index] ?? '',
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
              Text(news?.content ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
