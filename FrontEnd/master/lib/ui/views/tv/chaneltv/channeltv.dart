import 'package:flutter/material.dart';
import 'package:mobile/services/tv_service.dart';
import 'package:mobile/ui/views/tv/chaneltv/chaneltvViewModel.dart';
import 'package:mobile/ui/views/tv/pubWidget/publicite.dart';
import 'package:mobile/ui/widget/drawerWidget/telaDrawer.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';

class ChanelTv extends StatefulWidget {
  const ChanelTv({super.key});

  @override
  State<ChanelTv> createState() => _ChanelTvState();
}

class _ChanelTvState extends State<ChanelTv> {
  List<String> imgs = [
    'assets/images/live.jpg',
    'assets/images/sport.jpg',
    'assets/images/diféré.jpg',
    'assets/images/rediffusion.jpg',
    'assets/images/films.jpg',
  ];
  Widget pub = const PubliciteWidget();

  final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tvService.playPub();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<ChannelTvViewModel>.reactive(
      viewModelBuilder: () => ChannelTvViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
            title: const Text(
              'Tela TV',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white),
            ),
            elevation: 5,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          drawer: const TelaDrawer(base: TelaDrawer.TV),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                pub,
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: imgs
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    _tvService.pause();
                                    switch (e) {
                                      case 'assets/images/live.jpg':
                                        model.navigateToLiveTV();
                                        break;
                                      case 'assets/images/sport.jpg':
                                        model.navigateToLiveTVSport();
                                        break;
                                      case 'assets/images/rediffusion.jpg':
                                        model.navigateToLiveTVDiffere();
                                        break;
                                      case 'assets/images/diféré.jpg':
                                        model.navigateToLiveTVExclu();
                                        break;
                                      case 'assets/images/films.jpg':
                                        model.navigateToLiveTVFilms();
                                        break;
                                    }
                                  },
                                  child: Image.asset(
                                    e,
                                    width: mq.size.width - 80,
                                    fit: BoxFit.fitWidth,
                                  )),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
