import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stroll_interview/configs/assets.dart';
import 'package:stroll_interview/utils/responsive_utils.dart';

class AppText extends StatelessWidget {
  final String text;
  final String appFont;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final TextAlign align;
  final FontStyle fontStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? lineHeight;
  final List<Shadow>? textShadows;
  final double? letterSpacing;
  final bool? softwrap;

  const AppText(this.text,
      {Key? key,
      this.appFont = AppFont.appFONT,
      this.fontSize,
      this.fontWeight,
      this.color = Colors.white,
      this.align = TextAlign.left,
      this.fontStyle = FontStyle.normal,
      this.maxLines,
      this.overflow,
      this.lineHeight,
      this.textShadows,
      this.letterSpacing,
      this.softwrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      softWrap: softwrap,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          fontSize: fontSize ?? 20.responsive,
          fontFamily: AppFont.appFONT,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color,
          fontStyle: fontStyle,
          height: lineHeight,
          letterSpacing: letterSpacing ?? 0.responsive,
          shadows: textShadows),
    );
  }
}
