import 'package:flutter/material.dart';
import 'package:mobile/ui/views/passwordChangeView/passwordChangeViewModel.dart';
import 'package:stacked/stacked.dart';

/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class PasswordChangeView extends StatefulWidget {
  const PasswordChangeView({super.key, required this.fromBank});

  final bool fromBank;
  @override
  _PasswordChangeViewState createState() => _PasswordChangeViewState();
}

class _PasswordChangeViewState extends State<PasswordChangeView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<PasswordChangeViewModel>.reactive(
        viewModelBuilder: () => PasswordChangeViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Modification',
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
                            const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                'Vous pouvez modifier votre mot de passe ici.',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            const Divider(),

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
                                    labelText: 'Mot de passe actuel',
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

                            /// new password field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !isPasswordVisible1,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.vpn_key_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    labelText: 'Nouveau mot de passe',
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
                                          isPasswordVisible1 =
                                              !isPasswordVisible1;
                                        });
                                      },
                                      icon: Icon(
                                        isPasswordVisible1
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: isPasswordVisible1
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Colors.black,
                                      ),
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Vous devez entrer un mot de passe';
                                  }
                                  if (value.length < 8) {
                                    return 'Mot de passe trop court';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.passwordn = value;
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
                                    labelText:
                                        'Confirmer le nouveau mot de passe',
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
                                    return 'Entrez le mot de passe à nouveau';
                                  }
                                  if (value != model.passwordn) {
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
                      showDialog(
                          context: context,
                          builder: (buildContext) => Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 24.0, horizontal: 16),
                                      child: Text(
                                        'Êtes vous sur de vouloir remplacer votre mot de passe?',
                                        textAlign: TextAlign.center,
                                        maxLines: 20,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.1),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextButton(
                                              onPressed: () =>
                                                  Navigator.of(buildContext)
                                                      .pop(),
                                              child: const Text(
                                                'Non',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.deepOrange,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  loading = true;
                                                });
                                                model
                                                    .changeMDP()
                                                    .catchError((error, trace) {
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (buildContext) =>
                                                              Dialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              24.0,
                                                                          horizontal:
                                                                              16),
                                                                      child:
                                                                          Text(
                                                                        error
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        maxLines:
                                                                            20,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.w600,
                                                                            letterSpacing: 1.1),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child: TextButton(
                                                                          onPressed: () => Navigator.of(buildContext).pop(),
                                                                          child: Text(
                                                                            'Ok',
                                                                            maxLines:
                                                                                2,
                                                                            style: TextStyle(
                                                                                color: Theme.of(context).colorScheme.primary,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w600),
                                                                          )),
                                                                    )
                                                                  ],
                                                                ),
                                                              ));
                                                });
                                                setState(() {});
                                              },
                                              child: Text(
                                                'Oui',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
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
                        'Changer mot de passe',
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
