import 'package:flutter/material.dart';
import 'package:mobile/ui/views/tv/pubWidget/publiciteViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class PubliciteWidget extends StatefulWidget {
  const PubliciteWidget({super.key});

  @override
  State<PubliciteWidget> createState() => _PubliciteWidgetState();
}

class _PubliciteWidgetState extends State<PubliciteWidget> {
  bool muted = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('desactivé');
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PubliciteViewModel>.reactive(
      viewModelBuilder: () => PubliciteViewModel(),
      builder: (context, model, child) => SafeArea(
          child: AspectRatio(
        aspectRatio: 16 / 8,
        child: Stack(children: [
          VideoPlayer(
            model.tvService.pubVideoController,
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
                    'assets/images/pub.png',
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  muted = !muted;
                  muted
                      ? model.tvService.pubVideoController.setVolume(0)
                      : model.tvService.pubVideoController.setVolume(50);
                  setState(() {});
                },
                child: Icon(
                  muted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
