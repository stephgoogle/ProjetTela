import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/tv_films/tvFilmsViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class TvFilm extends StatefulWidget {
  const TvFilm({super.key});

  @override
  State<TvFilm> createState() => _TvFilmState();
}

class _TvFilmState extends State<TvFilm> {
  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvFilmViewModel>.reactive(
      viewModelBuilder: () => TvFilmViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AspectRatio(
            aspectRatio: model.tvService.filmVideoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(
                  model.tvService.filmVideoController,
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
                          'assets/images/film.png',
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
    _tvService.playPub();
  }
}
