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

class DeleteButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool canDelete;
  const DeleteButton(
      {super.key, required this.onPressed, required this.canDelete});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          widget.onPressed();
        },
        child: SizedBox(
          width: 38.responsive,
          height: 16.responsive,
          child: AppText(
            "Delete",
            color: widget.canDelete
                ? const Color(0xFFF5F5F5)
                : const Color(0xFF5D6369),
            appFont: AppFont.appFONT,
            fontSize: 13.responsive,
            fontWeight: FontWeight.w400,
            align: TextAlign.center,
            lineHeight: 15.6.appLineHeight(13.responsive),
          ),
        ),
      ),
    );
  }
}
