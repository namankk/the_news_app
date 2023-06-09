import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content;

  const NewsTile(
      {super.key, required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                    image: CachedNetworkImageProvider(imgUrl),
                    height: MediaQuery.of(context).size.width/100*30,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                title,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                desc,
                maxLines: 2,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              )
            ],
          ),
        ));
  }
}
