import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilsExt on num {
  double get wm {
    final half = this / 2;
    return half + half.w;
  }

  double get hm {
    final half = this / 2;
    return half + half.h;
  }

  double get rm {
    final half = this / 2;
    return half + half.r;
  }

  double get w75 => this * .25 + (this * .75).w;
  double get h75 => this * .25 + (this * .75).h;
  double get r75 => this * .25 + (this * .75).r;

  SizedBox get gapH => SizedBox(height: h);

  SizedBox get gapW => SizedBox(width: w);

  BorderRadiusGeometry get borderRadiusGeometry =>
      BorderRadius.circular(toDouble());

  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  Radius get radius => Radius.circular(toDouble());

  EdgeInsetsGeometry get paddingAll => EdgeInsets.all(toDouble());
}
