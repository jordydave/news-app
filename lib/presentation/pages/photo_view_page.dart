import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  static const routeName = '/photo-view';

  final String url;
  final String tag;
  const PhotoViewPage({Key? key, required this.url, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PhotoView(
            heroAttributes: PhotoViewHeroAttributes(tag: tag),
            loadingBuilder: (context, chunk) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            imageProvider: CachedNetworkImageProvider(url),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
