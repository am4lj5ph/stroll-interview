import 'package:simple_shadow/simple_shadow.dart';
import 'package:stroll_interview/configs/assets.dart';
import 'package:stroll_interview/utils/app_text_line_height_utils.dart';
import 'package:stroll_interview/utils/responsive_utils.dart';
import 'package:stroll_interview/widgets/app_radio_button.dart';
import 'package:stroll_interview/widgets/app_stroke_text.dart';
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
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _background(),
          _bgGradient(),
          _titleWidget(),
          _questionWidget(),
          _Options(),
          _recordButtonAndNextButton(),
          _bottomnNavigationBar(),
        ],
      ),
    );
  }

  Widget _background() {
    return Image.asset(
      Assets.images.background,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget _bgGradient() {
    return Image.asset(
      Assets.images.bgGradient,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget _titleWidget() {
    return Padding(
      padding: EdgeInsets.only(
        top: 63.responsive,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_titleText(), _dropDownIcon()],
          ),
          SizedBox(height: 2.responsive),
          _timerAndNumOfPersonsWidget(),
        ],
      ),
    );
  }

  _dropDownIcon() {
    return Padding(
      padding: EdgeInsets.only(top: 6.responsive, left: 8.responsive),
      child: Image.asset(
        Assets.images.dropdownIcon,
        height: 8.responsive,
        width: 12.responsive,
      ),
    );
  }

  _timerAndNumOfPersonsWidget() {
    return Center(
      child: SimpleShadow(
        color: Colors.black,
        opacity: 0.3,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _timerIcon(),
            SizedBox(
              width: 3.27.responsive,
            ),
            _timerText(),
            SizedBox(width: 9.73.responsive - 3.5.responsive),
            _personIcon(),
            SizedBox(width: 4.7.responsive - 2.3.responsive),
            Padding(
              padding: EdgeInsets.only(top: 2.5.responsive),
              child: AppText(
                103.toString(),
                appFont: AppFont.appFONT,
                fontSize: 12.responsive,
                lineHeight: 0,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFF5F5F5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timerIcon() {
    return Image.asset(
      Assets.icons.timerIcon,
      height: 15.responsive,
      width: 13.responsive,
    );
  }

  Widget _timerText() {
    const int hours = 22;
    const int mins = 00;
    return Padding(
        padding: EdgeInsets.only(top: 2.5.responsive),
        child: AppText(
          '${hours.toString().padLeft(2, '0')}h ${mins.toString().padLeft(2, '0')}m',
          appFont: AppFont.appFONT,
          fontSize: 12.responsive,
          lineHeight: 0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFF5F5F5),
        ));
  }

  Widget _personIcon() {
    return Image.asset(
      Assets.icons.personIcon,
      height: 13.responsive,
      width: 10.responsive,
    );
  }

  Widget _titleText() {
    return SimpleShadow(
      opacity: 0.2,
      child: AppStrokeText(
        text: 'Stroll Bonfire',
        textStyle: TextStyle(
          fontFamily: AppFont.appFONT,
          fontSize: 34.responsive,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFCCC8FF),
          height: 1.125,
          shadows: [
            Shadow(
              offset: const Offset(0, 0),
              blurRadius: 7.9,
              color: const Color(0xFF000000).withOpacity(0.2),
            ),
            const Shadow(
              offset: Offset(0, 0),
              blurRadius: 2,
              color: Color(0xFFBEBEBE),
            ),
            const Shadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: Color(0xFF24232F),
            ),
          ],
        ),
        strokeColor: const Color(0xFFB3ADF6),
        strokeWidth: 1.5.responsive,
      ),
    );
  }

  _questionWidget() {
    const question = "What is your favorite time of the day?";
    const author = "Angelina, 28";
    const subtext = 'Mine is definitely the peace in the morning.';
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            SizedBox(
              height: 464.responsive,
            ),
            Row(
              children: [
                SizedBox(
                  width: 96.responsive,
                ),
                Expanded(
                  child: AppText(
                    question,
                    appFont: AppFont.appFONT,
                    fontSize: 20.responsive,
                    fontWeight: FontWeight.w700,
                    lineHeight: 20.responsive.appLineHeight(20.responsive),
                    align: TextAlign.left,
                    color: const Color(0xFFF5F5F5),
                  ),
                ),
                SizedBox(
                  width: 36.responsive,
                ),
              ],
            ),
            SizedBox(
              height: 9.responsive,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  '"$subtext"',
                  appFont: AppFont.appFONT,
                  fontStyle: FontStyle.italic,
                  fontSize: 12.responsive,
                  fontWeight: FontWeight.w400,
                  lineHeight: 14.4.responsive.appLineHeight(12.responsive),
                  color: const Color(0xFFCBC9FF).withOpacity(0.7),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 428.responsive,
          left: 27.responsive,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 32.responsive,
                top: 7.responsive,
                child: Container(
                  height: 22.5.responsive,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.responsive),
                      color: const Color(0xFF121518).withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.3),
                            offset: const Offset(0, 14),
                            blurRadius: 16)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 32.responsive, right: 8.responsive),
                    child: Center(
                      child: AppStrokeText(
                        text: author,
                        textStyle: TextStyle(
                            fontFamily: AppFont.appFONT,
                            fontSize: 10.responsive,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFF5F5F5),
                            height:
                                1.21.responsive.appLineHeight(11.responsive)),
                        strokeColor: const Color(0xFF000000),
                        strokeWidth: 0.11,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.responsive,
                width: 60.responsive,
                decoration: BoxDecoration(
                    color: const Color(0xFF121517),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.4),
                          offset: const Offset(0, 3.407442092895508),
                          blurRadius: 11.926048278808594)
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(5.responsive),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      Assets.images.profile_pic,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

_recordButtonAndNextButton() {
  return Positioned(
    top: 678.responsive,
    bottom: 86.responsive,
    child: SizedBox(
      height: 48.responsive,
      width: 345.responsive,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            2.5.responsive, 0.responsive, 2.5.responsive, 0.responsive),
        child: Row(
          children: [
            AppText(
              'Pick your option.\nSee who has a similar mind.',
              fontSize: 11.responsive,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFE5E5E5),
            ),
            const Spacer(),
            _recordButton(),
            const SizedBox(
              width: 6,
            ),
            _nextButton(),
          ],
        ),
      ),
    ),
  );
}

_recordButton() {
  return Image.asset(
    Assets.images.record,
    height: 48.responsive,
    width: 48.responsive,
  );
}

_nextButton() {
  return Image.asset(
    Assets.images.next,
    height: 48.responsive,
    width: 48.responsive,
  );
}

_bottomnNavigationBar() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      color: const Color(0xFF0F1115),
      height: 79.responsive,
      width: 375.responsive,
      child: Column(
        children: [
          SizedBox(
            height: 4.responsive,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _cardsButton(),
              SizedBox(
                width: 20.responsive,
              ),
              _flameButton(),
              SizedBox(
                width: 14.responsive,
              ),
              _chatButton(),
              SizedBox(
                width: 9.responsive,
              ),
              _userButton(),
            ],
          ),
        ],
      ),
    ),
  );
}

_cardsButton() {
  return Image.asset(
    Assets.images.cards,
    height: 28.responsive,
    width: 27.99957.responsive,
  );
}

_flameButton() {
  return Image.asset(
    Assets.images.flame,
    height: 29.responsive,
    width: 22.53168.responsive,
  );
}

_chatButton() {
  return Image.asset(
    Assets.images.chat,
    height: 28.responsive,
    width: 27.99957.responsive,
  );
}

_userButton() {
  return Image.asset(
    Assets.images.user,
    height: 44.responsive,
    width: 44.responsive,
  );
}

_Options() {
  return Positioned(
    top: 541.responsive,
    child: const AppRadioButton(options: {
      "A": "The peace in the early mornings",
      "B": "The magical golden hours",
      "C": "The serenity past midnight",
      "D": "Wind-down time after dinners"
    }),
  );
}
