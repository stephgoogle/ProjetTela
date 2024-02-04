import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/tv_exclu/tvExcluViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class TvExclu extends StatefulWidget {
  const TvExclu({super.key});

  @override
  State<TvExclu> createState() => _TvExcluState();
}

class _TvExcluState extends State<TvExclu> {
  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvExcluViewModel>.reactive(
      viewModelBuilder: () => TvExcluViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AspectRatio(
            aspectRatio: model.tvService.excluVideoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(
                  model.tvService.excluVideoController,
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
                          'assets/images/exclu.png',
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
