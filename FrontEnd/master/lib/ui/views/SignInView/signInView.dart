import 'package:flutter/material.dart';
import 'package:mobile/ui/views/SignInView/signInViewModel.dart';
import 'package:stacked/stacked.dart';

/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;
  bool isPasswordVisible2 = false;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Inscription',
                    style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: Theme.of(context).colorScheme.primary,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                elevation: 5,
              ),
              backgroundColor: Colors.white,
              body: Scrollbar(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ///Info
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Divider(),
                            const Text(
                              'Photo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Divider(),

                            /// photo
                            SizedBox(
                              height: mediaQuery.size.width,
                              width: mediaQuery.size.width,
                              child: InkWell(
                                child: model.photo != null
                                    ? Image.file(
                                        model.photo!,
                                        fit: BoxFit.contain,
                                      )
                                    : const Center(
                                        child: Icon(Icons.add),
                                      ),
                                onTap: () async {
                                  await model.pickPhoto().whenComplete(() {
                                    setState(() {});
                                  });
                                },
                              ),
                            ),

                            const Divider(),
                            const Text(
                              'Informations',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Divider(),

                            /// nom field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_outline,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Nom',
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre nom';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.nom = value;
                                },
                              ),
                            ),

                            /// prenom field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_outline,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Prénoms',
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre prénom';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.prenom = value;
                                },
                              ),
                            ),

                            /// phone field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone_android,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  prefixText: '+225',
                                  labelText: 'Numéro de téléphone',
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre numéro de téléphone';
                                  }
                                  if (value.length != 10) {
                                    return 'Entrez un numéro de téléphone valide';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.phone = value;
                                },
                              ),
                            ),

                            /// password field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !isPasswordVisible,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.vpn_key_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    labelText: 'Mot de passe',
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
                                    suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      icon: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: isPasswordVisible
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Colors.black,
                                      ),
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer votre mot de passe';
                                  }
                                  if (value.length < 8) {
                                    return 'Mot de passe trop court';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.password = value;
                                },
                              ),
                            ),

                            /// confirm password field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !isPasswordVisible2,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.vpn_key_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    labelText: 'Confirmer le mote de passe',
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
                                    suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible2 =
                                              !isPasswordVisible2;
                                        });
                                      },
                                      icon: Icon(isPasswordVisible2
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Entrez votre mot de passe à nouveau';
                                  }
                                  if (value != model.password) {
                                    return 'Assurez vous d\'avoir bien répéter votre mot de passe';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  /// check the password
                                  setState(() {
                                    // if (!value.ma(model.password)) {
                                    //
                                    // } else {
                                    //
                                    // }
                                  });
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                  onPressed: () => model.navigateToCGU(),
                                  child: const Text(
                                    'cliquez ICI pour consulter nos conditions générales d\'itulisation',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),

                            /// IS démarcheur
                            CheckboxListTile(
                                value: model.isAccepted,
                                onChanged: (r) {
                                  setState(() {
                                    model.isAccepted = r!;
                                  });
                                },
                                title: Text(
                                  "En cochant cette case, je déclare avoir lu et approuvé les conditions générales d'utilisation de la plateforme TELA. Lire nos conditions  \"cliquez plus haut\"",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                checkColor: Colors.white,
                                activeColor:
                                    Theme.of(context).colorScheme.primary),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() && !loading) {
                      model.isAccepted
                          ? {
                              setState(() {
                                loading = true;
                              }),
                              model.signIn().catchError((error, trace) {
                                setState(() {
                                  loading = false;
                                });
                                showDialog(
                                    context: context,
                                    builder: (buildContext) => Dialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 24.0,
                                                        horizontal: 16),
                                                child: Text(
                                                  error.toString(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 20,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1.1),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(
                                                                buildContext)
                                                            .pop(),
                                                    child: Text(
                                                      'Ok',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ));
                              })
                            }
                          : showDialog(
                              context: context,
                              builder: (buildContext) => Dialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(24.0),
                                          child: Text(
                                            'Vous dever accepter nos conditions générales d\'itulisation',
                                            maxLines: 3,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(buildContext),
                                              child: Text(
                                                'Retour',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        )
                                      ],
                                    ),
                                  ));
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: model.isAccepted
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6),
                      fixedSize: Size(mediaQuery.size.width - 20, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: Visibility(
                      visible: !loading,
                      replacement: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Créer le profil',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
