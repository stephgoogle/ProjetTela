import 'package:flutter/material.dart';
import 'package:mobile/ui/views/tv/tv_live/tvLiveViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class TvLive extends StatefulWidget {
  const TvLive({
    super.key,
  });

  @override
  State<TvLive> createState() => _TvLiveState();
}

class _TvLiveState extends State<TvLive> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvLiveViewModel>.reactive(
      viewModelBuilder: () => TvLiveViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AspectRatio(
            aspectRatio: model.tvService.liveVideoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(
                  model.tvService.liveVideoController,
                  key: UniqueKey(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/images/live.png',
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
