import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:mobile/ui/views/ebank/bank_resume/bankViewModel.dart';
import 'package:mobile/ui/views/ebank/compte/compte.dart';
import 'package:mobile/ui/views/ebank/epargne/epargne.dart';
import 'package:mobile/ui/widget/bank_epargne_tab_header.dart';
import 'package:mobile/ui/widget/bank_profile_tab_header.dart';
import 'package:mobile/ui/widget/drawerWidget/telaDrawer.dart';
import 'package:stacked/stacked.dart';

class Bank extends StatefulWidget {
  final bool hasEpargne;
  const Bank({super.key, required this.hasEpargne});

  @override
  State<Bank> createState() => _BankState();
}

class _BankState extends State<Bank> with SingleTickerProviderStateMixin {
  late TabController tabController;
  static const String _BASE_URL = "http://office.telaci.com/public/";
  List<Widget> tabHeads = [];
  List<Widget> tabswidget = [];
  double compteBalance = 0;
  double epargneBalance = 0;
  bool isVir = true;

  @override
  void initState() {
    super.initState();
    tabswidget.add(const Compte());
    tabHeads.add(BankProfileTabHeader());
    if (widget.hasEpargne) {
      tabswidget.add(const Epargne());
      tabHeads.add(BankEpargneTabHeader());
    }
    tabController =
        TabController(length: widget.hasEpargne ? 2 : 1, vsync: this);
    tabController.addListener(() {
      setState(() {
        isVir = tabController.index == 1;
      });
    });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<BankViewModel>.reactive(
      viewModelBuilder: () => BankViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Visibility(
              visible: model.authService.bankProfile != null,
              replacement: Text(
                'Tela Finance',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3,
                    color: Theme.of(context).colorScheme.primary),
              ),
              child: Text(
                'Mon espace personnel',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
            actions: [
              Visibility(
                visible: model.authService.bankProfile != null,
                child: InkWell(
                  onTap: () => model.changeMDP(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: Icon(
                      Icons.key,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              )
            ],
            elevation: 5,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),
          drawer: const TelaDrawer(
            base: TelaDrawer.FINANCE,
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Container(
                height: mq.size.height + 1.1,
                width: mq.size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fond_fin.jpg'),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /// infos soldes and accounts
                    Visibility(
                      visible: model.authService.bankProfile != null,
                      replacement: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40.0,
                            ),
                            SizedBox(
                              height: 120.0,
                              width: 120.0,
                              child: Image.asset(
                                'assets/images/logo_2.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: mq.size.height / 3,
                              alignment: Alignment.center,
                              child: Text(
                                'Connectez vous pour accéder à votre espace personnel',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 24,
                                    letterSpacing: 1.3,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          /// nom
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipOval(
                                      child: InkWell(
                                        onTap: () =>
                                            model.navigateTochangePhoto(),
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Image.network(
                                            '$_BASE_URL${model.authService.bankProfile?.photo ?? ''}',
                                            loadingBuilder: (_,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) =>
                                                (loadingProgress == null)
                                                    ? child
                                                    : const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                            errorBuilder: (_, obj, er) =>
                                                Image.asset(
                                              'assets/images/logo.png',
                                              width: 50,
                                              fit: BoxFit.fitWidth,
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                maxWidth: mq.size.width * 0.35),
                                            child: Text(
                                              '${model.authService.bankProfile?.nom ?? ''} ${model.authService.bankProfile?.prenom ?? ''}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            model.authService.bankProfile
                                                    ?.phone ??
                                                '',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    TextButton(
                                      onPressed: () => model.deconnection(),
                                      style: TextButton.styleFrom(
                                        // backgroundColor: Theme.of(context).colorScheme.primary,
                                        shape: const StadiumBorder(),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.0, horizontal: 4),
                                        child: Text(
                                          'Déconnexion',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                              color: Colors.deepOrange),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: !(model
                                              .authService.user?.isComplete ??
                                          true),
                                      child: TextButton(
                                        onPressed: () =>
                                            model.navigateToIdentification(),
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50))),
                                        child: SizedBox(
                                          height: 40,
                                          width: mq.size.width / 3,
                                          child: const Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2.0,
                                                    horizontal: 12),
                                                child: Text(
                                                  'profil incomplet. Cliquez ici',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.deepOrange,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// Solde Disponible
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Solde total',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'fr_FR',
                                              name: 'F CFA',
                                              decimalDigits: 0)
                                          .format((model.authService.bankProfile
                                                      ?.balance ??
                                                  0) +
                                              (model.authService.bankEpargne
                                                      ?.balance ??
                                                  0)),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Solde total disponible',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'fr_FR',
                                              name: 'F CFA',
                                              decimalDigits: 0)
                                          .format(((model
                                                              .authService
                                                              .bankProfile
                                                              ?.balance ??
                                                          0) +
                                                      (model
                                                              .authService
                                                              .bankEpargne
                                                              ?.balance ??
                                                          0) >=
                                                  5000
                                              ? ((model.authService.bankProfile
                                                          ?.balance ??
                                                      0) +
                                                  (model.authService.bankEpargne
                                                          ?.balance ??
                                                      0) -
                                                  5000)
                                              : 0)),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TabBar(
                            controller: tabController,
                            tabs: tabHeads,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                        visible: model.authService.bankProfile != null,

                        /// auth
                        replacement: Column(
                          children: [
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: mq.size.width * 0.7),
                              child: TextButton(
                                  onPressed: () => model.navigateToLogin(),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16),
                                    child: Text(
                                      'Se connecter',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: mq.size.width * 0.7),
                              child: TextButton(
                                  onPressed: () => model.navigateToSignIn(),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16),
                                    child: Text(
                                      'Créer un profile',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),

                        /// TAB VIEW
                        child: SizedBox(
                          height: mq.size.height / 2.5,
                          width: mq.size.width,
                          child: TabBarView(
                              controller: tabController, children: tabswidget),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
