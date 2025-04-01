import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.assetName, {
    super.key,
    this.size,
    this.color,
    this.badgeColor,
    this.matchTextDirection = false,
  });

  final String assetName;
  final double? size;
  final Color? color;
  final Color? badgeColor;
  final bool matchTextDirection;

  @override
  Widget build(BuildContext context) {
    final hasBadge = badgeColor != null;

    final icon = SvgPicture.asset(
      assetName,
      height: size,
      width: size,
      fit: BoxFit.contain,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      matchTextDirection: matchTextDirection,
      clipBehavior: Clip.none,
    );

    if (!hasBadge) {
      return icon;
    }

    final badgeSize = size == null ? 3.rm : size! / 4.2;
    final badgeOffst = badgeSize / 2;

    return Stack(
      children: [
        icon,
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            icon,
            PositionedDirectional(
              top: -badgeOffst,
              end: -badgeOffst,
              child: CircleAvatar(
                radius: badgeSize,
                backgroundColor: badgeColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
