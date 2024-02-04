import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile/ui/views/IdentificationView//identificationViewModel.dart';
import 'package:stacked/stacked.dart';

/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class IdentificationView extends StatefulWidget {
  const IdentificationView({super.key});

  @override
  _IdentificationViewState createState() => _IdentificationViewState();
}

class _IdentificationViewState extends State<IdentificationView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<IdentificationViewModel>.reactive(
        viewModelBuilder: () => IdentificationViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Identification',
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
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                                'Complétez votre profil pour accéder nos services'),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //
                            // /// photo
                            // Divider(),
                            // const Text('Photo',
                            //   style: TextStyle(
                            //       color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                            // Divider(),
                            // SizedBox(
                            //   height: _mediaQuery.size.width,
                            //   width: _mediaQuery.size.width,
                            //   child: InkWell(
                            //     child: model.photo != null? Image.file(model.photo!,
                            //       fit: BoxFit.contain,
                            //     )
                            //         :
                            //     const Center(
                            //       child: Icon(Icons.add),
                            //     ),
                            //     onTap: () async {
                            //       await model.pickPhoto().whenComplete(() {
                            //         setState(() {
                            //
                            //         });
                            //       });
                            //     },
                            //   ),
                            // ),
                            //

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
                                initialValue: model.nom,
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
                                onChanged: (value) {
                                  model.nom = value;
                                },
                              ),
                            ),

                            /// prenom field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: model.prenom,
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
                                onChanged: (value) {
                                  model.prenom = value;
                                },
                              ),
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
                                  return null;
                                },
                                onChanged: (value) {
                                  model.phone = value;
                                },
                              ),
                            ),

                            /// phone2 field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                autofocus: false,
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
                                onChanged: (value) {
                                  model.phone2 = value;
                                },
                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            /// genre
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 20.0),
                                    child: Text('Genre'),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          const Text('Homme'),
                                          Radio<bool>(
                                              value: true,
                                              groupValue: model.isMan,
                                              onChanged: (val) {
                                                setState(() {
                                                  model.isMan = true;
                                                });
                                              }),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text('Femme'),
                                          Radio<bool>(
                                              value: false,
                                              groupValue: model.isMan,
                                              onChanged: (val) {
                                                setState(() {
                                                  model.isMan = false;
                                                });
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            ///date de naissance
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: InkWell(
                                splashColor: Colors.blue,
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  showDatePicker(
                                    context: this.context,
                                    initialDate:
                                        DateTime(DateTime.now().year - 15),
                                    firstDate: DateTime(1940),
                                    lastDate: DateTime(
                                        DateTime.now().year - 15, 12, 31),
                                    builder: (datePickcontext, child) {
                                      return Theme(
                                        data: ThemeData.dark().copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            onPrimary: Colors.white,
                                            surface: Colors.white,
                                            onSurface: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          dialogBackgroundColor: Colors.white,
                                        ),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxHeight:
                                                  mediaQuery.size.height * 0.7),
                                          child: child!,
                                        ),
                                      );
                                    },
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        model.birthDay = value;
                                        // model.dateS = ;
                                        // final d = DateTime.now();
                                        // if (model.dateS != langText.today &&
                                        //     d.isBefore(value)) {
                                        //   // isPeriodic = true;
                                        // }
                                      });
                                    }
                                  });
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'Date de naissance',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.edit_calendar,
                                        size: 24,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${model.birthDay.day} / ${model.birthDay.month} / ${model.birthDay.year}',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// Lieu de naissance field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Lieu de naissance',
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
                                    return 'Vous devez entrer lieu de naissance ';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.birthPlace = value;
                                },
                              ),
                            ),

                            /// nationnalité

                            TextButton.icon(
                              icon: Icon(
                                Icons.place_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Row(
                                children: [
                                  const Text(
                                    'nationnalité: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.2,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    model.nationnalite,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary))),
                              onPressed: () => showCountryPicker(
                                context: context,
                                showPhoneCode:
                                    false, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  print('Select country: ${country.name}');
                                  setState(() {
                                    model.nationnalite = country.name;
                                  });
                                },
                              ),
                            ),

                            /// PAYS
                            TextButton.icon(
                              icon: Icon(
                                Icons.place_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Row(
                                children: [
                                  const Text(
                                    'Pays: ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.2,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    model.pays,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary))),
                              onPressed: () => showCountryPicker(
                                context: context,
                                showPhoneCode:
                                    false, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  print('Select country: ${country.name}');
                                  setState(() {
                                    model.pays = country.name;
                                  });
                                },
                              ),
                            ),

                            /// Lieu de residence field
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.place_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText: 'Ville de résidence',
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
                                    return 'Vous devez entrer votre ville de résidence ';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.villeResidence = value;
                                },
                              ),
                            ),

                            const Divider(),
                            const Text(
                              'Document d\'identification',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Divider(),

                            /// doc number
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.file_present,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  labelText:
                                      'Numero de Carte d\'identitée / passeport',
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
                                    return 'Vous devez entrer le numero du document ';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  model.docNumber = value;
                                },
                              ),
                            ),

                            const Divider(),
                            const Text(
                              'Document verso',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Divider(),

                            /// doc recto
                            SizedBox(
                              height: mediaQuery.size.width,
                              width: mediaQuery.size.width,
                              child: InkWell(
                                child: model.docRecto != null
                                    ? Image.file(
                                        model.docRecto!,
                                        fit: BoxFit.contain,
                                      )
                                    : const Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              'Document recto',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                onTap: () async {
                                  await model.pickRecto().whenComplete(() {
                                    setState(() {});
                                  });
                                },
                              ),
                            ),

                            /// doc verso
                            const Divider(),
                            const Text(
                              'Document verso',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Divider(),
                            SizedBox(
                              height: mediaQuery.size.width,
                              width: mediaQuery.size.width,
                              child: InkWell(
                                child: model.docVerso != null
                                    ? Image.file(
                                        model.docVerso!,
                                        fit: BoxFit.contain,
                                      )
                                    : const Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              'Document verso',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                onTap: () async {
                                  await model.pickVerso().whenComplete(() {
                                    setState(() {});
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    model.identify().catchError((error, trace) {
                                      setState(() {
                                        loading = false;
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (buildContext) => Dialog(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 24.0,
                                                          horizontal: 16),
                                                      child: Text(
                                                        error.toString(),
                                                        textAlign:
                                                            TextAlign.center,
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      buildContext)
                                                                  .pop(),
                                                          child: Text(
                                                            'Ok',
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ));
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    fixedSize:
                                        Size(mediaQuery.size.width - 20, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80.0),
                                  child: Visibility(
                                    visible: !loading,
                                    replacement:
                                        const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                    child: const Text(
                                      'Je confirme mes informations personnelles',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                ),
              ),
            ));
  }
}
