import 'package:flutter/material.dart';
import 'package:mobile/ui/views/profile/profileViewModel.dart';
import 'package:mobile/ui/widget/drawerWidget/telaDrawer.dart';
import 'package:mobile/ui/widget/profilCliper.dart';
import 'package:stacked/stacked.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String code = '';
  static const String _BASE_URL = "http://office.telaci.com/public/";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: const Text(
              'Tela',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.white),
            ),
            actions: [
              Visibility(
                visible: model.authService.user != null,
                child: InkWell(
                  onTap: () => model.changeMDP(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                    child: Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
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
          drawer: const TelaDrawer(base: TelaDrawer.PROFIL),
          body: SingleChildScrollView(
            child: Scrollbar(
              child: StreamBuilder<bool>(
                  stream: model.isAuth,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                        return snapshot.data!
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  /// info personnelles
                                  ClipPath(
                                    clipper: ProfileClipper(),
                                    child: Container(
                                      height: 250,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          /// noms + phone

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                ClipOval(
                                                  child: InkWell(
                                                    onTap: () => model
                                                        .navigateTochangePhoto(),
                                                    child: SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child: Image.network(
                                                        '$_BASE_URL${model.user?.photo}',
                                                        loadingBuilder: (_,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) =>
                                                            (loadingProgress ==
                                                                    null)
                                                                ? child
                                                                : const Center(
                                                                    child:
                                                                        CircularProgressIndicator()),
                                                        errorBuilder:
                                                            (_, obj, er) =>
                                                                Image.asset(
                                                          'assets/images/logo.png',
                                                          width: 50,
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxWidth: 150),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          '${model.user!.nom} ${model.user!.prenom}',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 1.2,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        model.user!.phone,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          model.deconnection(),
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.white,
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 2.0,
                                                                horizontal: 4),
                                                        child: Text(
                                                          'Déconnexion',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 1.2,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: !model
                                                          .user!.isComplete,
                                                      child: TextButton(
                                                        onPressed: () => model
                                                            .navigateToIdentification(),
                                                        style: TextButton.styleFrom(
                                                            backgroundColor:
                                                                Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50))),
                                                        child: const SizedBox(
                                                          height: 45,
                                                          width: 125,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        2.0,
                                                                    horizontal:
                                                                        12),
                                                            child: Text(
                                                              'profil Incomplet. Cliquez ici',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .deepOrange,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.all(8.0),
                                          //   child: Row(
                                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Text('${model.user!.nom} ${model.user!.prenom}',
                                          //         textAlign: TextAlign.right,
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 18.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //       Text(model.user!.phone,
                                          //         textAlign:TextAlign.left,
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize:18.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // Column(
                                          //   children: [
                                          //     const Padding(
                                          //       padding: EdgeInsets.all(2.0),
                                          //       child: Text('Solde',
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 14.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Padding(
                                          //       padding: const EdgeInsets.all(2.0),
                                          //       child: Text('XOF ${model.user?.balance.toString()??'0'}',
                                          //         style: const TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 18.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          /// Catalogue
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 8),
                                              child: TextButton(
                                                  onPressed: () =>
                                                      model.user!.isSuspended
                                                          ? showDialog(
                                                              context: context,
                                                              builder:
                                                                  (buildContext) =>
                                                                      Dialog(
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(30)),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            const Padding(
                                                                              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                                                                              child: Text(
                                                                                'Votre compte est suspendu! \n Assurez vous d\'avoir un abonnement',
                                                                                textAlign: TextAlign.center,
                                                                                maxLines: 20,
                                                                                style: TextStyle(fontSize: 14, color: Colors.deepOrange, fontWeight: FontWeight.w600, letterSpacing: 1.1),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: TextButton(
                                                                                  onPressed: () => Navigator.of(buildContext).pop(),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    maxLines: 2,
                                                                                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),
                                                                                  )),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))
                                                          : model.abonnement !=
                                                                  null
                                                              ? model
                                                                  .navigateToGalery()
                                                              : showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (buildContext) =>
                                                                          Dialog(
                                                                            backgroundColor:
                                                                                Colors.white,
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                const Padding(
                                                                                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                                                                                  child: Text(
                                                                                    'Votre compte est suspendu! \n Assurez vous d\'avoir un abonnement',
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 20,
                                                                                    style: TextStyle(fontSize: 14, color: Colors.deepOrange, fontWeight: FontWeight.w600, letterSpacing: 1.1),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: TextButton(
                                                                                      onPressed: () => Navigator.of(buildContext).pop(),
                                                                                      child: Text(
                                                                                        'Ok',
                                                                                        maxLines: 2,
                                                                                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),
                                                                                      )),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )),
                                                  style: TextButton.styleFrom(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      backgroundColor: model
                                                                  .abonnement !=
                                                              null
                                                          ? Colors.white
                                                          : Colors.white
                                                              .withOpacity(0.4),
                                                      elevation: 5,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(30))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 14.0,
                                                        vertical: 4),
                                                    child: Text(
                                                      'Mon Catalogue',
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 40,
                                  ),

                                  /// Pass visite
                                  Visibility(
                                    visible: model.passVisite != null,
                                    replacement: Column(
                                      children: [
                                        const Text(
                                          'Entrez le code de votre pass visite si dessous et confirmer',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.1),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            autofocus: false,
                                            maxLength: 8,
                                            minLines: 1,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.credit_card,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              suffix: InkWell(
                                                onTap: () =>
                                                    model.chechPass(code),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'vérifier',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              labelText: 'Pass visites',
                                              labelStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .labelStyle,
                                              enabledBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .enabledBorder,
                                              focusedBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedBorder,
                                              hintStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .hintStyle,
                                            ),
                                            onChanged: (value) {
                                              code = value;
                                            },
                                            // validator: (value) {
                                            //
                                            // },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () =>
                                                model.navigateToVisitePass(),
                                            child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            45)),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Text(
                                                    'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (!model.passVisite!.isExpired) {
                                              model.navigateToMaisonVisite();
                                            }
                                          },
                                          onLongPress: () => showDialog(
                                              context: context,
                                              builder: (buildContext) => Dialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      12.0,
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            'Voulez vous oublier ce pass? \n (Votre code vous permet d\'y avoir accès plus tard.)',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.1),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                    'Annuler',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .deepOrange,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    model
                                                                        .authService
                                                                        .deletePass();
                                                                    setState(
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Supprimer',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .primary,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      ' ${model.passVisite != null ? model.passVisite!.numberOfVisites : ''} visite(s )',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors.black
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.passVisite != null
                                                          ? model.passVisite!
                                                                  .isExpired
                                                              ? 'Expiré'
                                                              : 'Actif'
                                                          : '',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors
                                                                    .deepOrange
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                ' ${model.passVisite != null ? 'Cliquez pour voir les maisons déja visitées' : ''}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const Divider(
                                                color: Colors.black,
                                                thickness: 0.7,
                                                indent: 35,
                                                endIndent: 35,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      model.strd,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.endd,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.passVisite != null
                                              ? model.passVisite!.isExpired
                                              : false,
                                          replacement: model.passVisite != null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () => model
                                                        .navigateToProlongeVisitePass(),
                                                    child: Card(
                                                        elevation: 8,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        45)),
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  24.0),
                                                          child: Text(
                                                            'Prolongez votre pass',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.2),
                                                          ),
                                                        )),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () =>
                                                  model.navigateToVisitePass(),
                                              child: Card(
                                                  elevation: 8,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              45)),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(24.0),
                                                    child: Text(
                                                      'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  /// abonnement
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        /// is actif?
                                        Visibility(
                                          visible: model.abonnement != null,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0, vertical: 1),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Abonnement Démarcheur',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.black
                                                            : Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  model.abonnement != null
                                                      ? 'Actif'
                                                      : 'inactif',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.deepOrange
                                                            : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.abonnement != null,
                                          child: const Divider(
                                            color: Colors.black,
                                            thickness: 0.7,
                                            indent: 35,
                                            endIndent: 35,
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.abonnement != null,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0, vertical: 1),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  model.abonnement != null
                                                      ? model.abonnement!
                                                          .startSTR()
                                                      : 'Du',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.black
                                                            : Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  model.enda,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.black
                                                            : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.abonnement == null,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            45)),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: InkWell(
                                                  onTap: () => model
                                                      .navigateToAbonnement(),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(24.0),
                                                    child: Text(
                                                      'Activer votre abonnement',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  /// auth
                                  ClipPath(
                                    clipper: ProfileClipper(),
                                    child: Container(
                                      height: 180,
                                      width: double.infinity,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          /// is connected
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Vous n\'êtes pas connecté!',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          /// auth
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                  onPressed: () =>
                                                      model.navigateToSignIn(),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30))),
                                                  child: const Text(
                                                    'Créer un profile',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                              TextButton(
                                                  onPressed: () =>
                                                      model.navigateToLogIn(),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30))),
                                                  child: const Text(
                                                    'Se connecter',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                            ],
                                          ),

                                          const SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),

                                  Visibility(
                                    visible: model.passVisite != null,
                                    replacement: Column(
                                      children: [
                                        const Text(
                                          'Entrez le code de votre pass visite si dessous et confirmer',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.1),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            autofocus: false,
                                            maxLength: 8,
                                            minLines: 1,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.credit_card,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              suffix: InkWell(
                                                onTap: () =>
                                                    model.chechPass(code),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'vérifier',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              labelText: 'Pass visites',
                                              labelStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .labelStyle,
                                              enabledBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .enabledBorder,
                                              focusedBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedBorder,
                                              hintStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .hintStyle,
                                            ),
                                            onChanged: (value) {
                                              code = value;
                                            },
                                            // validator: (value) {
                                            //
                                            // },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () =>
                                                model.navigateToVisitePass(),
                                            child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            45)),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Text(
                                                    'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (!model.passVisite!.isExpired) {
                                              model.navigateToMaisonVisite();
                                            }
                                          },
                                          onLongPress: () => showDialog(
                                              context: context,
                                              builder: (buildContext) => Dialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      12.0,
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            'Voulez vous oublier ce pass? \n (Votre code vous permet d\'y avoir accès plus tard.)',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.1),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                    'Annuler',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .deepOrange,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    model
                                                                        .authService
                                                                        .deletePass();
                                                                    setState(
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Supprimer',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .primary,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      ' ${model.passVisite != null ? model.passVisite!.numberOfVisites : ''} visite(s )',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors.black
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.passVisite != null
                                                          ? model.passVisite!
                                                                  .isExpired
                                                              ? 'Expiré'
                                                              : 'Actif'
                                                          : '',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors
                                                                    .deepOrange
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                ' ${model.passVisite != null ? 'Cliquez pour voir les maisons déja visitées' : ''}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const Divider(
                                                color: Colors.black,
                                                thickness: 0.7,
                                                indent: 35,
                                                endIndent: 35,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      model.strd,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.endd,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.passVisite != null
                                              ? model.passVisite!.isExpired
                                              : false,
                                          replacement: model.passVisite != null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () => model
                                                        .navigateToProlongeVisitePass(),
                                                    child: Card(
                                                        elevation: 8,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        45)),
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  24.0),
                                                          child: Text(
                                                            'Prolongez votre pass',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.2),
                                                          ),
                                                        )),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () =>
                                                  model.navigateToVisitePass(),
                                              child: Card(
                                                  elevation: 8,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              45)),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(24.0),
                                                    child: Text(
                                                      'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  /// sign in
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => model.navigateToSignIn(),
                                      child: Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45)),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          child: const Padding(
                                            padding: EdgeInsets.all(24.0),
                                            child: Text(
                                              'Devenir démarcheur c\'est simple avec Tela! \n Créez votre profil',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              );
                      case ConnectionState.done:
                        return snapshot.data!
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  /// info personnelles
                                  ClipPath(
                                    clipper: ProfileClipper(),
                                    child: Container(
                                      height: 250,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          /// noms + phone

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                ClipOval(
                                                  child: InkWell(
                                                    onTap: () => model
                                                        .navigateTochangePhoto(),
                                                    child: SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child: Image.network(
                                                        '$_BASE_URL${model.user?.photo}',
                                                        loadingBuilder: (_,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) =>
                                                            (loadingProgress ==
                                                                    null)
                                                                ? child
                                                                : const Center(
                                                                    child:
                                                                        CircularProgressIndicator()),
                                                        errorBuilder:
                                                            (_, obj, er) =>
                                                                Image.asset(
                                                          'assets/images/logo.png',
                                                          width: 50,
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints(
                                                                maxWidth: 150),
                                                        child: Text(
                                                          '${model.user!.nom} ${model.user!.prenom}',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 1.2,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        model.user!.phone,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  children: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          model.deconnection(),
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.white,
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 2.0,
                                                                horizontal: 4),
                                                        child: Text(
                                                          'Déconnexion',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 1.2,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: !model
                                                          .user!.isComplete,
                                                      child: TextButton(
                                                        onPressed: () => model
                                                            .navigateToIdentification(),
                                                        style: TextButton.styleFrom(
                                                            backgroundColor:
                                                                Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50))),
                                                        child: const SizedBox(
                                                          height: 45,
                                                          width: 125,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        2.0,
                                                                    horizontal:
                                                                        12),
                                                            child: Text(
                                                              'profil Incomplet. Cliquez ici',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .deepOrange,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.all(8.0),
                                          //   child: Row(
                                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Text('${model.user!.nom} ${model.user!.prenom}',
                                          //         textAlign: TextAlign.right,
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 18.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //       Text(model.user!.phone,
                                          //         textAlign:TextAlign.left,
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize:18.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // Column(
                                          //   children: [
                                          //     const Padding(
                                          //       padding: EdgeInsets.all(2.0),
                                          //       child: Text('Solde',
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 14.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Padding(
                                          //       padding: const EdgeInsets.all(2.0),
                                          //       child: Text('XOF ${model.user?.balance.toString()??'0'}',
                                          //         style: const TextStyle(
                                          //           color: Colors.white,
                                          //           fontSize: 18.0,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          /// Catalogue
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 8),
                                              child: TextButton(
                                                  onPressed: () =>
                                                      model.user!.isSuspended
                                                          ? showDialog(
                                                              context: context,
                                                              builder:
                                                                  (buildContext) =>
                                                                      Dialog(
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(30)),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            const Padding(
                                                                              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                                                                              child: Text(
                                                                                'Votre compte est suspendu! \n Assurez vous d\'avoir un abonnement',
                                                                                textAlign: TextAlign.center,
                                                                                maxLines: 20,
                                                                                style: TextStyle(fontSize: 14, color: Colors.deepOrange, fontWeight: FontWeight.w600, letterSpacing: 1.1),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: TextButton(
                                                                                  onPressed: () => Navigator.of(buildContext).pop(),
                                                                                  child: Text(
                                                                                    'Ok',
                                                                                    maxLines: 2,
                                                                                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),
                                                                                  )),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ))
                                                          : model.abonnement !=
                                                                  null
                                                              ? model
                                                                  .navigateToGalery()
                                                              : showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (buildContext) =>
                                                                          Dialog(
                                                                            backgroundColor:
                                                                                Colors.white,
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                const Padding(
                                                                                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                                                                                  child: Text(
                                                                                    'Votre compte est suspendu! \n Assurez vous d\'avoir un abonnement',
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 20,
                                                                                    style: TextStyle(fontSize: 14, color: Colors.deepOrange, fontWeight: FontWeight.w600, letterSpacing: 1.1),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: TextButton(
                                                                                      onPressed: () => Navigator.of(buildContext).pop(),
                                                                                      child: Text(
                                                                                        'Ok',
                                                                                        maxLines: 2,
                                                                                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 18, fontWeight: FontWeight.w600),
                                                                                      )),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )),
                                                  style: TextButton.styleFrom(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      backgroundColor: model
                                                                  .abonnement !=
                                                              null
                                                          ? Colors.white
                                                          : Colors.white
                                                              .withOpacity(0.4),
                                                      elevation: 5,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(30))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 14.0,
                                                        vertical: 4),
                                                    child: Text(
                                                      'Mon Catalogue',
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 40,
                                  ),

                                  /// Pass visite
                                  Visibility(
                                    visible: model.passVisite != null,
                                    replacement: Column(
                                      children: [
                                        const Text(
                                          'Entrez le code de votre pass visite si dessous et confirmer',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.1),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            autofocus: false,
                                            maxLength: 8,
                                            minLines: 1,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.credit_card,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              suffix: InkWell(
                                                onTap: () =>
                                                    model.chechPass(code),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'vérifier',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              labelText: 'Pass visites',
                                              labelStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .labelStyle,
                                              enabledBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .enabledBorder,
                                              focusedBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedBorder,
                                              hintStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .hintStyle,
                                            ),
                                            onChanged: (value) {
                                              code = value;
                                            },
                                            // validator: (value) {
                                            //
                                            // },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () =>
                                                model.navigateToVisitePass(),
                                            child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            45)),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Text(
                                                    'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (!model.passVisite!.isExpired) {
                                              model.navigateToMaisonVisite();
                                            }
                                          },
                                          onLongPress: () => showDialog(
                                              context: context,
                                              builder: (buildContext) => Dialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      12.0,
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            'Voulez vous oublier ce pass? \n (Votre code vous permet d\'y avoir accès plus tard.)',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.1),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                    'Annuler',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .deepOrange,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    model
                                                                        .authService
                                                                        .deletePass();
                                                                    setState(
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Supprimer',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .primary,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      ' ${model.passVisite != null ? model.passVisite!.numberOfVisites : ''} visite(s )',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors.black
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.passVisite != null
                                                          ? model.passVisite!
                                                                  .isExpired
                                                              ? 'Expiré'
                                                              : 'Actif'
                                                          : '',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors
                                                                    .deepOrange
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                ' ${model.passVisite != null ? 'Cliquez pour voir les maisons déja visitées' : ''}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const Divider(
                                                color: Colors.black,
                                                thickness: 0.7,
                                                indent: 35,
                                                endIndent: 35,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      model.strd,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.endd,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.passVisite != null
                                              ? model.passVisite!.isExpired
                                              : false,
                                          replacement: model.passVisite != null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () => model
                                                        .navigateToProlongeVisitePass(),
                                                    child: Card(
                                                        elevation: 8,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        45)),
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  24.0),
                                                          child: Text(
                                                            'Prolongez votre pass',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.2),
                                                          ),
                                                        )),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () =>
                                                  model.navigateToVisitePass(),
                                              child: Card(
                                                  elevation: 8,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              45)),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(24.0),
                                                    child: Text(
                                                      'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  /// abonnement
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        /// is actif?
                                        Visibility(
                                          visible: model.abonnement != null,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0, vertical: 1),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Abonnement Démarcheur',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.black
                                                            : Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  model.abonnement != null
                                                      ? 'Actif'
                                                      : 'inactif',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.deepOrange
                                                            : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.abonnement != null,
                                          child: const Divider(
                                            color: Colors.black,
                                            thickness: 0.7,
                                            indent: 35,
                                            endIndent: 35,
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.abonnement != null,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0, vertical: 1),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  model.abonnement != null
                                                      ? model.abonnement!
                                                          .startSTR()
                                                      : 'Du',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.black
                                                            : Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  model.enda,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        model.abonnement != null
                                                            ? Colors.black
                                                            : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.abonnement == null,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            45)),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: InkWell(
                                                  onTap: () => model
                                                      .navigateToAbonnement(),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(24.0),
                                                    child: Text(
                                                      'Activer votre abonnement',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  /// auth
                                  ClipPath(
                                    clipper: ProfileClipper(),
                                    child: Container(
                                      height: 180,
                                      width: double.infinity,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          /// is connected
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Vous n\'êtes pas connecté!',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          /// auth
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                  onPressed: () =>
                                                      model.navigateToSignIn(),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30))),
                                                  child: const Text(
                                                    'Créer un profile',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                              TextButton(
                                                  onPressed: () =>
                                                      model.navigateToLogIn(),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .primary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30))),
                                                  child: const Text(
                                                    'Se connecter',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                            ],
                                          ),

                                          const SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),

                                  Visibility(
                                    visible: model.passVisite != null,
                                    replacement: Column(
                                      children: [
                                        const Text(
                                          'Entrez le code de votre pass visite si dessous et confirmer',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.1),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            autofocus: false,
                                            maxLength: 8,
                                            minLines: 1,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.credit_card,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              suffix: InkWell(
                                                onTap: () =>
                                                    model.chechPass(code),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      'vérifier',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              labelText: 'Pass visites',
                                              labelStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .labelStyle,
                                              enabledBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .enabledBorder,
                                              focusedBorder: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedBorder,
                                              hintStyle: Theme.of(context)
                                                  .inputDecorationTheme
                                                  .hintStyle,
                                            ),
                                            onChanged: (value) {
                                              code = value;
                                            },
                                            // validator: (value) {
                                            //
                                            // },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () =>
                                                model.navigateToVisitePass(),
                                            child: Card(
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            45)),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Text(
                                                    'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (!model.passVisite!.isExpired) {
                                              model.navigateToMaisonVisite();
                                            }
                                          },
                                          onLongPress: () => showDialog(
                                              context: context,
                                              builder: (buildContext) => Dialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      12.0,
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            'Voulez vous oublier ce pass? \n (Votre code vous permet d\'y avoir accès plus tard.)',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.1),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                  child:
                                                                      const Text(
                                                                    'Annuler',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .deepOrange,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    model
                                                                        .authService
                                                                        .deletePass();
                                                                    setState(
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Supprimer',
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .colorScheme
                                                                            .primary,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      ' ${model.passVisite != null ? model.passVisite!.numberOfVisites : ''} visite(s )',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors.black
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.passVisite != null
                                                          ? model.passVisite!
                                                                  .isExpired
                                                              ? 'Expiré'
                                                              : 'Actif'
                                                          : '',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color: model.passVisite !=
                                                                null
                                                            ? model.passVisite!
                                                                    .isExpired
                                                                ? Colors.grey
                                                                : Colors
                                                                    .deepOrange
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                ' ${model.passVisite != null ? 'Cliquez pour voir les maisons déja visitées' : ''}',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const Divider(
                                                color: Colors.black,
                                                thickness: 0.7,
                                                indent: 35,
                                                endIndent: 35,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 24.0,
                                                        vertical: 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      model.strd,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      model.endd,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 1.2,
                                                        color:
                                                            model.passVisite !=
                                                                    null
                                                                ? Colors.black
                                                                : Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: model.passVisite != null
                                              ? model.passVisite!.isExpired
                                              : false,
                                          replacement: model.passVisite != null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () => model
                                                        .navigateToProlongeVisitePass(),
                                                    child: Card(
                                                        elevation: 8,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        45)),
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  24.0),
                                                          child: Text(
                                                            'Prolongez votre pass',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    1.2),
                                                          ),
                                                        )),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () =>
                                                  model.navigateToVisitePass(),
                                              child: Card(
                                                  elevation: 8,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              45)),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(24.0),
                                                    child: Text(
                                                      'Achetez votre pass pour consulter nos logement et bureaux disponible',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1.2),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  /// sign in
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => model.navigateToSignIn(),
                                      child: Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(45)),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          child: const Padding(
                                            padding: EdgeInsets.all(24.0),
                                            child: Text(
                                              'Devenir démarcheur c\'est simple avec Tela! \n Créez votre profil',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              );
                    }
                  }),
            ),
          )),
    );
  }
}
