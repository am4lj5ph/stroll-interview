import 'package:simple_shadow/simple_shadow.dart';
import 'package:stroll_interview/configs/assets.dart';
import 'package:stroll_interview/screens/recording.dart';
import 'package:stroll_interview/utils/app_text_line_height_utils.dart';
import 'package:stroll_interview/utils/responsive_utils.dart';
import 'package:stroll_interview/widgets/app_delete_button.dart';
import 'package:stroll_interview/widgets/app_radio_button.dart';
import 'package:stroll_interview/widgets/app_recorder_button.dart';
import 'package:stroll_interview/widgets/app_stroke_text.dart';
import 'package:stroll_interview/widgets/app_submit_button.dart';
import 'package:stroll_interview/widgets/app_text_widget.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _background(),
          _bgGradient(),
          _screenWidget(),
        ],
      ),
    );
  }

  Widget _bgGradient() {
    return Image.asset(
      Assets.images.fade_overlay,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget _background() {
    return Image.asset(
      Assets.images.profile_pic,
      fit: BoxFit.cover,
      height: 605.responsive,
      width: 476.responsive,
    );
  }

  Widget _screenWidget() {
    return Column(
      children: [
        _pageNavigation(),
        SizedBox(
          height: 14.responsive,
        ),
        _titleBar(),
        SizedBox(
          height: 280.responsive,
        ),
        _questionWidget(),
        SizedBox(
          height: 29.responsive,
        ),
        _recorderWidget(),
      ],
    );
  }

  Widget _titleBar() {
    return Container(
      width: 375.responsive,
      height: 29.responsive,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.images.nav_button,
            width: 44.responsive,
            height: 44.responsive,
          ),
          Container(
            width: 287.responsive,
            height: 29.responsive,
            child: Center(
              child: AppText(
                "Angelina, 28",
                appFont: AppFont.appFONT,
                fontStyle: FontStyle.normal,
                fontSize: 18.responsive,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Image.asset(
            Assets.images.options_button,
            width: 44.responsive,
            height: 44.responsive,
          ),
        ],
      ),
    );
  }

  Widget _questionWidget() {
    return Row(
      children: [
        SizedBox(
          width: 15.responsive,
        ),
        SizedBox(
          width: 345.responsive,
          height: 166.responsive,
          child: Column(
            children: [
              SizedBox(
                width: 83.responsive,
                height: 81.responsive,
                child: Image.asset(
                  Assets.icons.question_icon,
                  width: 35.805.responsive,
                  height: 45.441.responsive,
                ),
              ),
              SizedBox(
                height: 6.responsive,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 31.responsive,
                  ),
                  SizedBox(
                    width: 280.responsive,
                    height: 48.responsive,
                    child: AppText(
                      "What is your favorite time of the day?",
                      align: TextAlign.center,
                      color: Color(0xFFF5F5F5),
                      appFont: AppFont.appFONT,
                      fontSize: 24.responsive,
                      fontWeight: FontWeight.w700,
                      lineHeight: 24.0.appLineHeight(24.responsive),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.responsive,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppText(
                      "“Mine is definitely the peace in the morning.”",
                      align: TextAlign.center,
                      color: Color.fromRGBO(203, 201, 255, 0.7),
                      appFont: AppFont.appFONT,
                      fontSize: 13.responsive,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      lineHeight: 15.6.appLineHeight(13.responsive),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recorderWidget() {
    return Recorder();
  }

  Widget _pageNavigation() {
    return Padding(
      padding: EdgeInsets.only(
        top: 44.responsive,
      ),
      child: Container(
        width: 338.responsive,
        height: 3.responsive,
        child: Row(children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFD2D2D2),
              borderRadius: BorderRadius.circular(80.0),
            ),
            height: 3.responsive,
            width: 160.responsive,
          )),
          SizedBox(
            width: 18.responsive,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(135, 135, 135, 0.5),
              borderRadius: BorderRadius.circular(80.0),
            ),
            height: 3.responsive,
            width: 160.responsive,
          )),
        ]),
      ),
    );
  }
}
