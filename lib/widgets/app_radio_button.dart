import 'package:stroll_interview/utils/app_text_line_height_utils.dart';
import 'package:stroll_interview/utils/responsive_utils.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:stroll_interview/widgets/app_text_widget.dart';

class AppRadioButton extends StatefulWidget {
  final Map<dynamic, dynamic> options;
  const AppRadioButton({Key? key, required this.options}) : super(key: key);

  @override
  State<AppRadioButton> createState() => _AppRadioButtonState();
}

class _AppRadioButtonState extends State<AppRadioButton> {
  var selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344.responsive,
      height: 126.responsive,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: widget.options.entries.map((e) {
          bool isSelected = e.key == selectedOption;
          return InkWell(
            onTap: () {
              setState(() {
                selectedOption = e.key;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 166.responsive,
              height: 57.responsive,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF232A2E),
                border: isSelected
                    ? Border.all(
                        color: const Color(0xFF8B88EF),
                        width: 2.responsive,
                      )
                    : null,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(-1, -1),
                    blurRadius: 2,
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                    spreadRadius: 0,
                    inset: true,
                  ),
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Color.fromRGBO(72, 72, 72, 0.30),
                    spreadRadius: 0,
                    inset: true,
                  ),
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 8,
                    color: Color.fromRGBO(0, 0, 0, 0.30),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.responsive, vertical: 12.responsive),
                child: Row(
                  children: [
                    Container(
                      height: 20.responsive,
                      width: 20.responsive,
                      decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF8B88EF)
                              : const Color(0xFFF5F5F5),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 20.responsive,
                          width: 20.responsive,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF8B88EF)
                                  : const Color(0xFF232A2E),
                              shape: BoxShape.circle),
                          child: AppText(
                            "${e.key}",
                            color: const Color(0xFFF5F5F5),
                            fontSize: 12.responsive,
                            align: TextAlign.center,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 9.responsive,
                    ),
                    Expanded(
                        child: AppText(
                      "${e.value}",
                      fontSize: 14.responsive,
                      fontWeight: FontWeight.w400,
                      maxLines: 2,
                      lineHeight: 14.7.appLineHeight(14.responsive),
                      overflow: TextOverflow.ellipsis,
                    ))
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
