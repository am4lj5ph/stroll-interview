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

class SubmitButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool canSubmit;
  const SubmitButton(
      {super.key, required this.onPressed, required this.canSubmit});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          widget.onPressed();
        },
        child: SizedBox(
          width: 40.responsive,
          height: 16.responsive,
          child: AppText(
            "Submit",
            color: widget.canSubmit
                ? const Color(0xFFF5F5F5)
                : const Color(0xFF5D6369),
            appFont: AppFont.appFONT,
            fontSize: 13.responsive,
            align: TextAlign.center,
            fontWeight: FontWeight.w400,
            lineHeight: 15.6.appLineHeight(13.responsive),
          ),
        ),
      ),
    );
  }
}
