import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio_cache/just_audio_cache.dart';
import 'package:species/src/presentation/global/colors.dart';

class CustomAudioBar extends StatefulWidget {
  final String audioUrl;
  final Color? backgroundColor;
  final Color? progressBarColor;

  const CustomAudioBar({
    super.key,
    required this.audioUrl,
    this.backgroundColor,
    this.progressBarColor,
  });

  @override
  State<CustomAudioBar> createState() => _CustomAudioBarState();
}

class _CustomAudioBarState extends State<CustomAudioBar>
    with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  final bool _audioCompleted = false;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..dynamicSet(url: widget.audioUrl);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _audioPlayer.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data;

        return Container(
          padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: widget.backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<PlayerState>(
                stream: _audioPlayer.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final playing = playerState?.playing;

                  if (!(playing ?? false)) {
                    return IconButton(
                      onPressed: _audioPlayer.play,
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: CustomColors.white,
                      ),
                    );
                  } else {
                    return IconButton(
                      onPressed: () {
                        if (positionData != null &&
                            positionData.position >= positionData.duration) {
                          _audioPlayer.seek(const Duration());
                        } else {
                          _audioPlayer.pause();
                        }
                      },
                      icon: Icon(
                        _audioCompleted
                            ? Icons.play_arrow_rounded
                            : Icons.pause_rounded,
                        color: CustomColors.white,
                      ),
                    );
                  }
                },
              ),
              Expanded(
                child: ProgressBar(
                  baseBarColor: CustomColors.primaryContainer,
                  bufferedBarColor: CustomColors.greyContainer,
                  progressBarColor: widget.progressBarColor,
                  thumbColor: widget.progressBarColor,
                  timeLabelTextStyle:
                      const TextStyle(color: CustomColors.white),
                  progress: positionData?.position ?? Duration.zero,
                  buffered: positionData?.bufferPosition ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  onSeek: _audioPlayer.seek,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PositionData {
  final Duration position, bufferPosition, duration;

  PositionData(this.position, this.bufferPosition, this.duration);
}
