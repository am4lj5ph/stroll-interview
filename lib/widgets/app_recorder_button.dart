import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:stroll_interview/configs/assets.dart';
import 'package:stroll_interview/utils/app_text_line_height_utils.dart';
import 'package:stroll_interview/utils/responsive_utils.dart';
import 'package:stroll_interview/widgets/app_delete_button.dart';
import 'package:stroll_interview/widgets/app_radio_button.dart';
import 'package:stroll_interview/widgets/app_stroke_text.dart';
import 'package:stroll_interview/widgets/app_submit_button.dart';
import 'package:stroll_interview/widgets/app_text_widget.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class RecordButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String button;
  RecordButton({required this.onPressed, required this.button});
  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SvgPicture.asset(
        widget.button,
        width: 64.0.responsive,
        height: 64.0.responsive,
      ),
    );
  }
}
