import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:stroll_interview/configs/assets.dart';
import 'package:stroll_interview/utils/app_text_line_height_utils.dart';
import 'package:stroll_interview/utils/responsive_utils.dart';
import 'package:stroll_interview/widgets/app_delete_button.dart';
import 'package:stroll_interview/widgets/app_recorder_button.dart';
import 'package:stroll_interview/widgets/app_submit_button.dart';
import 'package:stroll_interview/widgets/app_text_widget.dart';

class Recorder extends StatefulWidget {
  const Recorder({super.key});

  @override
  State<Recorder> createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  final recorder = AudioRecorder();
  final player = AudioPlayer();
  RecordState recorderState = RecordState.stop;
  bool isPlayingAudio = false;
  bool isRecordingFinished = false;
  int _recordDuration = 0;
  int _playingDuration = 0;
  Timer? _recordingTimer;
  Timer? _playingTimer;

  String audioFilePath = '';

  void checkRecordingAlreadyExist() async {
    try {
      final isExist = await File(audioFilePath).exists();
      if (isExist) {
        try {
          await File(audioFilePath).delete();
          print("deleted");
          print("${audioFilePath}");
        } catch (e) {
          print("${e}");
        }
      }
    } catch (e) {
      print("${e}");
    }
  }

  void setupRecorderPath() async {
    const audioFileName = "audiofile.aac";
    audioFilePath = await getfilepath(audioFileName: audioFileName);
    checkRecordingAlreadyExist();
  }

  getfilepath({required String audioFileName}) async {
    var directory = await getTemporaryDirectory();
    var directoryPath = directory.path;
    return "$directoryPath/$audioFileName";
  }

  @override
  void initState() {
    recorder.onStateChanged().listen((recordState) {
      recorderState = recordState;
      setState(() {});
    });
    player.onPlayerComplete.listen((playerState) {
      player.pause();
      player.seek(Duration.zero);
      isPlayingAudio = false;
      _stopPlayingTimer();
      setState(() {});
    });
    player.onPositionChanged.listen((event) {});
    setupRecorderPath();
    super.initState();
  }

  startRecorder() async {
    _startRecordingTimer();
    print("started recording");
    print("${audioFilePath}");
    await recorder.start(RecordConfig(encoder: AudioEncoder.aacLc),
        path: audioFilePath);
  }

  stopRecorder() async {
    await recorder.stop();
    isRecordingFinished = true;
    _stopRecordingTimer();
    print("stopped recording ${audioFilePath}");
    setState(() {});
  }

  startPlayer() async {
    isPlayingAudio = true;
    print("player path ${audioFilePath}");
    player.play(DeviceFileSource(audioFilePath));

    setState(() {});
    _startPlayerTimer();
    print("started player");
  }

  pausePlayer() async {
    isPlayingAudio = false;
    setState(() {});
    await player.pause();
    print("paused player");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _recordingTimer?.cancel();
    _playingTimer?.cancel();
    recorder.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 15.responsive,
        ),
        SizedBox(
          width: 345.responsive,
          height: 207.responsive,
          child: Column(
            children: [
              SizedBox(
                  width: 275.responsive,
                  height: 16.responsive,
                  child: _buildTimer()),
              SizedBox(
                height: 39.responsive,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1.responsive,
                color: Color(0xFF36393E),
              ),
              SizedBox(
                height: 49.responsive,
              ),
              SizedBox(
                width: double.infinity,
                height: 64.responsive,
                child: Row(
                  children: [
                    DeleteButton(
                      canDelete: isRecordingFinished,
                      onPressed: () {
                        setupRecorderPath();
                        recorderState = RecordState.stop;
                        isPlayingAudio = false;
                        isRecordingFinished = false;
                        _recordDuration = 0;
                        _playingDuration = 0;
                        _recordingTimer?.cancel();
                        _playingTimer?.cancel();
                        setState(() {});
                      },
                    ),
                    RecordButton(
                      onPressed: () {
                        if (isRecordingFinished) {
                          if (isPlayingAudio) {
                            pausePlayer();
                          } else {
                            print("pause called");
                            startPlayer();
                          }
                        } else {
                          if (recorderState == RecordState.record) {
                            stopRecorder();
                          } else {
                            startRecorder();
                          }
                        }
                      },
                      button: recorderButtons(),
                    ),
                    SubmitButton(
                      canSubmit: isRecordingFinished,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22.responsive,
              ),
              SizedBox(
                width: 52.responsive,
                height: 16.responsive,
                child: AppText(
                  "Unmatch",
                  color: Color(0xFFBE2020),
                  appFont: AppFont.appFONT,
                  fontSize: 13.responsive,
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center,
                  lineHeight: 15.6.appLineHeight(13.responsive),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  String recorderButtons() {
    if (isRecordingFinished) {
      if (isPlayingAudio) {
        print("pause");
        return Assets.icons.pause_button;
      } else {
        print("play");
        return Assets.icons.play_button;
      }
    } else {
      if (recorderState == RecordState.record) {
        print("stop");
        return Assets.icons.stop_button;
      } else {
        print("start");
        return Assets.icons.record_button;
      }
    }
  }

  Widget _buildTimer() {
    if (isRecordingFinished) {
      final String _recordDurationMinutes =
          _formatNumber(_recordDuration ~/ 60);
      final String _recordDurationSeconds = _formatNumber(_recordDuration % 60);
      final String _playerDurationMinutes =
          _formatNumber(_playingDuration ~/ 60);
      final String _playerDurationSeconds =
          _formatNumber(_playingDuration % 60);
      return AppText(
        "$_playerDurationMinutes : $_playerDurationSeconds / $_recordDurationMinutes : $_recordDurationSeconds",
        color: const Color(0xFFF5F5F5),
        align: TextAlign.center,
        appFont: AppFont.appFONT,
        fontSize: 13.responsive,
        fontWeight: FontWeight.w400,
        lineHeight: 15.6.appLineHeight(13.responsive),
      );
    } else {
      final String minutes = _formatNumber(_recordDuration ~/ 60);
      final String seconds = _formatNumber(_recordDuration % 60);
      return AppText(
        "$minutes:$seconds",
        color: _recordDuration == 0
            ? const Color(0xFF5D6369)
            : const Color(0xFFBFBDFF),
        align: TextAlign.center,
        appFont: AppFont.appFONT,
        fontSize: 13.responsive,
        fontWeight: FontWeight.w400,
        lineHeight: 15.6.appLineHeight(13.responsive),
      );
    }
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startRecordingTimer() {
    _recordingTimer?.cancel();

    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }

  void _startPlayerTimer() {
    _playingTimer?.cancel();

    _playingTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (isPlayingAudio) {
          _playingDuration++;
        } else {
          return;
        }
      });
    });
  }

  void _stopRecordingTimer() {
    _recordingTimer?.cancel();
  }

  void _stopPlayingTimer() {
    _recordingTimer?.cancel();
    _playingDuration = 0;
  }
}
