import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Map<String, String>? headers;
  final Color? color;
  final BlendMode? colorBlendMode;
  final Alignment? alignment;
  final Widget Function(BuildContext context, String error)? errorWidget;
  final Widget? placeholder;

  const PlatformCachedNetworkImage(
    this.imageUrl, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.headers,
    this.color,
    this.colorBlendMode,
    this.alignment,
    this.errorWidget,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? Image.network(
            imageUrl,
            fit: fit,
            width: width,
            height: height,
            headers: headers,
            color: color,
            colorBlendMode: colorBlendMode,
            alignment: alignment ?? Alignment.center,
            errorBuilder: errorWidget != null ? ((context, e, stack) => errorWidget!.call(context, e.toString())) : null,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: placeholder ??
                    CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                    ),
              );
            },
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            width: width,
            height: height,
            httpHeaders: headers,
            color: color,
            colorBlendMode: colorBlendMode,
            alignment: alignment ?? Alignment.center,
            errorWidget: errorWidget != null ? ((context, e, stack) => errorWidget!.call(context, e.toString())) : null,
            progressIndicatorBuilder:
                placeholder == null ? (context, url, loadingProgress) => Center(child: CircularProgressIndicator(value: loadingProgress.progress)) : null,
            placeholder: placeholder != null ? (_, __) => placeholder! : null,
          );
  }
}
