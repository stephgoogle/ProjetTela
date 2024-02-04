import 'package:flutter/material.dart';
import 'package:mobile/ui/views/tv/programmetv/programmetvViewModel.dart';
import 'package:mobile/ui/widget/tela_t_v_programe_card.dart';
import 'package:stacked/stacked.dart';

class ProgrammeTv extends StatefulWidget {
  const ProgrammeTv({super.key});

  @override
  State<ProgrammeTv> createState() => _ProgrammeTvState();
}

class _ProgrammeTvState extends State<ProgrammeTv> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProgrammeTvViewModel>.reactive(
      viewModelBuilder: () => ProgrammeTvViewModel(),
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
          drawer: Drawer(
            elevation: 5,
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DrawerHeader(
                        child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    )),
                    TextButton(
                        onPressed: () {
                          model.navigateToAcceuil();
                        },
                        child: const Text('Acceuil')),
                    TextButton(
                        onPressed: () {
                          model.navigateToProfile();
                        },
                        child: const Text('profile')),
                    TextButton(
                        onPressed: () {
                          model.navigateToRechercheLogement();
                        },
                        child: const Text('Trouver un logement')),
                    TextButton(
                        onPressed: () {
                          model.navigateToRechercheBureau();
                        },
                        child: const Text('Trouver un Bureau')),
                    TextButton(
                        onPressed: () {
                          model.navigateToEbank();
                        },
                        child: const Text('Tela Finance')),
                    TextButton(
                        onPressed: () {
                          model.navigateToTV();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        child: const Text(
                          'Tela TV',
                          style: TextStyle(color: Colors.white),
                        )),
                  ]),
            ),
          ),
          body: ListView(
            children: model.program
                .map((e) => InkWell(
                    onTap: () => model.navigateToLiveTV(e),
                    child: TelaTVProgrameCard(
                      programmeTV: e,
                    )))
                .toList(),
          )),
    );
  }
}
