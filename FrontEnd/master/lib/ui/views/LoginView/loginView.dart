import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'loginViewModel.dart';

/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Connexion',
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
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: mediaQuery.size.height - 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ///Info
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                            /// phone field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: model.phone,
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
                                    return 'Vous devez entrer votre nuùéro de téléphone';
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
                                autofocus: true,
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
                                      icon: Icon(isPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && !loading) {
                      setState(() {
                        loading = true;
                      });
                      model
                          .login()
                          .then((us) => model.navigateToProfile())
                          .catchError((error, trace) {
                        setState(() {
                          loading = false;
                        });
                        showDialog(
                            context: context,
                            builder: (buildContext) => Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 24.0, horizontal: 16),
                                        child: Text(
                                          error.toString(),
                                          textAlign: TextAlign.center,
                                          maxLines: 20,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.1),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                            onPressed: () =>
                                                Navigator.of(buildContext)
                                                    .pop(),
                                            child: Text(
                                              'Ok',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      )
                                    ],
                                  ),
                                ));
                      });
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
                        'Connexion',
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
