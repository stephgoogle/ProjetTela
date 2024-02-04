import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/tv_pub/tvPubViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class TvPub extends StatefulWidget {
  const TvPub({super.key});

  @override
  State<TvPub> createState() => _TvPubState();
}

class _TvPubState extends State<TvPub> {
  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvPubViewModel>.reactive(
      viewModelBuilder: () => TvPubViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            foregroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_2.png',
                  width: 30,
                  fit: BoxFit.fitWidth,
                ),
                const Text(
                  'Publicité',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3,
                    color: Colors.white),
                ),
              ],
            ),
            elevation: 5,
          ),
          body: Column(
            children: [
              AspectRatio(
                aspectRatio:
                    model.tvService.pubVideoController.value.aspectRatio,
                child: Stack(
                  children: [
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
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  "Vous souhaitez présenter votre activité sur notre plateforme ? \n Cliquez sur le button ci-dessous 👇",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () {
                  model.navigatePublicite();
                },
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  'souscrire à une insertion pub',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tvService.playPub();
  }
}
