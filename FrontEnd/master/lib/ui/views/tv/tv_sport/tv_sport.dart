import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/tv_sport/tvSportViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class TvSport extends StatefulWidget {
  const TvSport({super.key});

  @override
  State<TvSport> createState() => _TvSportState();
}

class _TvSportState extends State<TvSport> {
  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvSportViewModel>.reactive(
      viewModelBuilder: () => TvSportViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AspectRatio(
            aspectRatio: model.tvService.sportVideoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(
                  model.tvService.sportVideoController,
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
                          'assets/images/sport.png',
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
