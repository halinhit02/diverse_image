library diverse_image;

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:diverse_image/string_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiverseImage extends StatelessWidget {
  const DiverseImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.size,
    this.boxFit = BoxFit.cover,
    this.color,
    this.borderRadius,
    this.isOval = false,
    this.alignment = Alignment.center,
    this.fromFile = false,
    this.blendMode,
  });

  final String path;
  final double? height;
  final double? width;
  final double? size;
  final BoxFit boxFit;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Alignment alignment;
  final bool isOval;
  final bool fromFile;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return SizedBox(
        height: height ?? size,
        width: width ?? size,
      );
    }
    return ClipRRect(
      borderRadius: borderRadius != null
          ? borderRadius!
          : BorderRadius.circular(isOval ? 100 : 0),
      child: path.isURL || path.startsWith('http://')
          ? path.contains('.svg')
              ? SvgPicture.network(
                  path,
                  width: width ?? size,
                  height: height ?? size,
                  fit: boxFit,
                  alignment: alignment,
                  colorFilter: color != null
                      ? ColorFilter.mode(
                          color!,
                          blendMode ?? BlendMode.srcIn,
                        )
                      : null,
                )
              : CachedNetworkImage(
                  imageUrl: path,
                  height: height ?? size,
                  width: width ?? size,
                  color: color,
                  fit: boxFit,
                  colorBlendMode: blendMode,
                  alignment: alignment,
                  errorWidget: (context, url, obj) => Container(
                    width: width ?? size,
                    height: height ?? size,
                    color: Colors.grey.shade200,
                  ),
                  errorListener: (obj) {
                    if (kDebugMode) {
                      print('>>> Custom image - Cached network image: $obj');
                    }
                  },
                )
          : fromFile
              ? Image.file(
                  File(path),
                  height: height ?? size,
                  width: width ?? size,
                  fit: boxFit,
                  color: color,
                  colorBlendMode: blendMode,
                  alignment: alignment,
                  errorBuilder: (context, url, obj) => Container(
                    width: width ?? size,
                    height: height ?? size,
                    color: Colors.grey.shade200,
                  ),
                )
              : path.contains('.svg')
                  ? SvgPicture.asset(
                      path,
                      height: height ?? size,
                      width: width ?? size,
                      fit: boxFit,
                      alignment: alignment,
                      colorFilter: color != null
                          ? ColorFilter.mode(
                              color!,
                              blendMode ?? BlendMode.srcIn,
                            )
                          : null,
                    )
                  : Image.asset(
                      path,
                      height: height ?? size,
                      width: width ?? size,
                      fit: boxFit,
                      color: color,
                      colorBlendMode: blendMode,
                      alignment: alignment,
                      errorBuilder: (context, url, stack) => Container(
                        width: width ?? size,
                        height: height ?? size,
                        color: Colors.grey,
                      ),
                    ),
    );
  }
}
