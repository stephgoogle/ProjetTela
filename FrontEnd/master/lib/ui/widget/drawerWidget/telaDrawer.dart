import 'package:flutter/material.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/ui/views/tv/question_quotidien/questionViewModel.dart';
import 'package:mobile/ui/widget/drawerWidget/telaDrawerViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

class TelaDrawer extends StatefulWidget {
  static const int HOME = 1;
  static const int PROFIL = 2;
  static const int LOGEMENT = 3;
  static const int BUREAU = 4;
  static const int FINANCE = 5;
  static const int TV = 6;
  static const int TV_PUB = 60;
  static const int TV_LIVE = 61;
  static const int TV_SPORT = 62;
  static const int TV_EXCLU = 63;
  static const int TV_REDIF = 64;
  static const int TV_FILMS = 65;

  final int base;

  const TelaDrawer({super.key, required this.base});

  @override
  State<TelaDrawer> createState() => _TelaDrawerState();
}

class _TelaDrawerState extends State<TelaDrawer> {
  bool tvDet = false;
  bool question_check = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<TelaDrawerViewModel>.reactive(
      viewModelBuilder: () => TelaDrawerViewModel(),
      builder: (context, model, child) => Drawer(
        elevation: 5,
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              DrawerHeader(
                child: Center(
              child: Image.asset('assets/images/logo.png'),
            )),
            TextButton.icon(
                onPressed: () {
                  model.navigateToAcceuil();
                },
                style: TextButton.styleFrom(
                  backgroundColor: widget.base == TelaDrawer.HOME
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  size: 18,
                  color: widget.base == TelaDrawer.HOME
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Acceuil',
                  style: TextStyle(
                    color: widget.base == TelaDrawer.HOME
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  model.navigateToProfile();
                },
                style: TextButton.styleFrom(
                  backgroundColor: widget.base == TelaDrawer.PROFIL
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 18,
                  color: widget.base == TelaDrawer.PROFIL
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'profile',
                  style: TextStyle(
                    color: widget.base == TelaDrawer.PROFIL
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  model.navigateToRechercheLogement();
                },
                style: TextButton.styleFrom(
                  backgroundColor: widget.base == TelaDrawer.LOGEMENT
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
                icon: Icon(
                  Icons.search,
                  size: 18,
                  color: widget.base == TelaDrawer.LOGEMENT
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Trouver un logement',
                  style: TextStyle(
                    color: widget.base == TelaDrawer.LOGEMENT
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                )),
              TextButton.icon(
                onPressed: () {
                  model.navigateToRechercheBureau();
                },
                style: TextButton.styleFrom(
                  backgroundColor: widget.base == TelaDrawer.BUREAU
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
                icon: Icon(
                  Icons.search,
                  size: 18,
                  color: widget.base == TelaDrawer.BUREAU
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Trouver un Bureau',
                  style: TextStyle(
                    color: widget.base == TelaDrawer.BUREAU
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                )),
              TextButton.icon(
              onPressed: () {
                model.navigateToEbank();
              },
              style: TextButton.styleFrom(
                backgroundColor: widget.base == TelaDrawer.FINANCE
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
              ),
              icon: Icon(
                Icons.account_balance_wallet_outlined,
                size: 18,
                color: widget.base == TelaDrawer.FINANCE
                    ? Colors.white
                    : Theme.of(context).colorScheme.primary,
              ),
              label: Text(
                'Tela Finance',
                style: TextStyle(
                  color: widget.base == TelaDrawer.FINANCE
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: mq.size.width * 0.6,
                      minWidth: mq.size.width * 0.6),
                  child: TextButton.icon(
                      onPressed: () {
                        model.navigateToTV();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: widget.base == TelaDrawer.TV
                            ? Colors.deepOrange
                            : Colors.white,
                      ),
                      icon: Image.asset(
                        'assets/images/tela_tv_logo.png',
                        height: 20,
                        fit: BoxFit.fitWidth,
                      ),
                      label: Text(
                        'Tela TV',
                        style: TextStyle(
                          color: widget.base == TelaDrawer.TV
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary,
                        ),
                      )),
                ),
                IconButton(
                    color: Colors.deepOrange,
                    constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
                    onPressed: () => setState(() {
                          tvDet = !tvDet;
                        }),
                    icon: Icon(tvDet
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down))
              ],
            ),
                Visibility(
              visible: tvDet,
              child: SizedBox(
                height: mq.size.height * 0.3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        /// pub
                        TextButton.icon(
                            onPressed: () {
                              model.navigateToPubTV();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: widget.base == TelaDrawer.TV_PUB
                                  ? Colors.deepOrange
                                  : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/pub.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Tela PUB',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_PUB
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )),

                        /// live
                        TextButton.icon(
                            onPressed: () {
                              model.navigateToLiveTV();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: widget.base == TelaDrawer.TV_LIVE
                                  ? Colors.deepOrange
                                  : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/live.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Tela LIVE',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_LIVE
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )),

                        /// sport
                        TextButton.icon(
                            onPressed: () {
                              model.navigateToLiveTVSport();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  widget.base == TelaDrawer.TV_SPORT
                                      ? Colors.deepOrange
                                      : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/sport.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Tela Sport',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_SPORT
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )),

                        /// exclu
                        TextButton.icon(
                            onPressed: () {
                              model.navigateToLiveTVExclu();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  widget.base == TelaDrawer.TV_EXCLU
                                      ? Colors.deepOrange
                                      : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/exclu.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Tela Exclusivitées',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_EXCLU
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )),

                        /// redif
                        TextButton.icon(
                            onPressed: () {
                              model.navigateToLiveTVDiffere();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: widget.base == TelaDrawer.TV_LIVE
                                  ? Colors.deepOrange
                                  : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/differe.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Tela Différé',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_LIVE
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )
                        ),

                        /// films
                        TextButton.icon(
                            onPressed: () {
                              model.navigateToLiveTVFilms();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  widget.base == TelaDrawer.TV_FILMS
                                      ? Colors.deepOrange
                                      : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/film.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Tela Films & séries',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_FILMS
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )
                        ),
                        /// Question du jour
                        TextButton.icon(
                            onPressed: () {
                              if(User.isStaff == 1){
                                setState(() {
                                  question_check = !question_check;
                                });
                              }else{
                                model.getQuestion().then((value) => {
                                model.navigateToDailyQuestion()
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                              widget.base == TelaDrawer.TV_FILMS
                                  ? Colors.deepOrange
                                  : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/film.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Question du jour',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_FILMS
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )
                        ),

                        ///Gagnant du jour
                        TextButton.icon(
                            onPressed: () {
                              DateTime now = DateTime.now();
                              print('############# heure : ${now.hour}:${now.minute} ##########');
                              model.getAllWinner().then((value) => {
                              model.navigateToWinner()
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                              widget.base == TelaDrawer.TV_FILMS
                                  ? Colors.deepOrange
                                  : Colors.white,
                            ),
                            icon: Image.asset(
                              'assets/images/film.png',
                              height: 20,
                              fit: BoxFit.fitWidth,
                            ),
                            label: Text(
                              'Gagnants du jour',
                              style: TextStyle(
                                color: widget.base == TelaDrawer.TV_FILMS
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            )
                        ),
                        Visibility(
                          visible: question_check,
                          child: SizedBox(
                            height: mq.size.height * 0.3,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ///
                                    TextButton.icon(
                                        onPressed: () {
                                          model.navigateToAddQuestion();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: widget.base == TelaDrawer.TV_PUB
                                              ? Colors.deepOrange
                                              : Colors.white,
                                        ),
                                        icon: Image.asset(
                                          'assets/images/pub.png',
                                          height: 20,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        label: Text(
                                          'Ajouter des questions',
                                          style: TextStyle(
                                            color: widget.base == TelaDrawer.TV_PUB
                                                ? Colors.white
                                                : Theme.of(context).colorScheme.primary,
                                          ),
                                        )),

                                    ///
                                    TextButton.icon(
                                        onPressed: () {
                                          model.getQuestion().then((value) => {
                                            model.navigateToDailyQuestion()
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: widget.base == TelaDrawer.TV_LIVE
                                              ? Colors.deepOrange
                                              : Colors.white,
                                        ),
                                        icon: Image.asset(
                                          'assets/images/live.png',
                                          height: 20,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        label: Text(
                                          'Repondre aux questions',
                                          style: TextStyle(
                                            color: widget.base == TelaDrawer.TV_LIVE
                                                ? Colors.white
                                                : Theme.of(context).colorScheme.primary,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
