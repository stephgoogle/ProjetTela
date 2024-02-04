import 'package:flutter/material.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/ui/views/publicite/pdf.dart';
import 'package:stacked/stacked.dart';

import 'publicite_viewmodel.dart';


class PubliciteView extends StatefulWidget {
  const PubliciteView({super.key});

  @override
  State<PubliciteView> createState() => _PubliciteViewState();
}

class _PubliciteViewState extends State<PubliciteView> {
  // final TVService _tvService = locator<TVService>();

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  bool next = false;

  @override
  Widget build(BuildContext context) {
     MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<PubliciteViewModel>.reactive(
      viewModelBuilder: () => PubliciteViewModel(),
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
                'Souscription Publicité',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3,
                    color: Colors.white),
              ),
            ],
          ),
          elevation: 5,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: !next?
          Column(
            children: [
              
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
              
                    /// phone field
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        // initialValue: model.phone,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color:
                                Theme.of(context).colorScheme.primary,
                          ),
                          labelText: 'Nom & Prénoms',
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
                            return 'Vous devez entrer votre nom et prénoms';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          model.name = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.business_outlined,
                            color:
                                Theme.of(context).colorScheme.primary,
                          ),
                          labelText: 'Entreprise',
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
                            return 'Vous devez entrer votre entreprise';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          model.companyName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.assignment_ind_rounded,
                            color:
                                Theme.of(context).colorScheme.primary,
                          ),
                          labelText: 'N° CNI',
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
                            return 'Vous devez entrer votre numéro CNI';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          model.cardNumber = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.support_agent,
                            color:
                                Theme.of(context).colorScheme.primary,
                          ),
                          labelText: 'N° Commercial/le',
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
                            return 'Vous devez entrer votre le numéro du commencial';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          model.commercial = value;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(18),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Choisir un pack',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.3,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 600,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.packs!.length,
                        itemBuilder: (context, index) {
                          final pack = model.packs![index];
                          String groupValue = pack.chooseTarif;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0,

                                )
                              ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                            ),
                            child:  Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    "Pack ${pack.name}",
                                      style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.3,
                                    color: Colors.black
                                    ),
                                  ),
                                  trailing: pack.name == model.choosePack?.name? 
                                    Icon(
                                      size:35,
                                      color:Colors.green,
                                      Icons.check_circle
                                    )
                                    :
                                  Icon(
                                      size:35,
                                      color:Colors.grey,
                                      Icons.check_circle_outline
                                    )
                                  
                                ),
                                SizedBox(
                                  height: 460,
                                  child: ListView(
                                    children: [
                                    
                                      ListTile(
                                        title:   Text(
                                        "Tarif :",
                                        style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                        ),
                                        
                                        ),
                                        subtitle: Column(
                                          children: [
                                            for(var item in pack.tarif)
                                            RadioListTile(
                                              title: Text(
                                                "${item['text']}"
                                              ),
                                              value: item['value'], 
                                              groupValue: groupValue, 
                                              onChanged: (value){
                                                  pack.chooseTarif = value;
                                                  groupValue = value;
                                                  setState(() {});
                                              }
                                            ),
                                           
                                            ListTile(
                                              title:  Text(
                                                "Particularité :",
                                                style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                                ),
                                              ),
                                              subtitle: Text(
                                                "${pack.particularite}"
                                              ),
                                            ),
                                            ListTile(
                                              title:  Text(
                                                "Visibilité :",
                                                style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                                ),
                                              ),
                                              subtitle: Text(
                                                "${pack.visibilite}"
                                              ),
                                            ),
                                            ListTile(
                                              title:  Text(
                                                "Avantage :",
                                                style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                                ),
                                              ),
                                              subtitle: Column(
                                                children: [
                                                  for(var item in pack.avantages)
                                                  Text(
                                                    "$item"
                                                  ),

                                                ],
                                              )
                                            ),
                                      
                                          ],
                                        ),
                                      ),
                                     
                                    ]
                                  )
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (groupValue.isEmpty) {
                                    
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
                                                      "veuillez choisir un tarif".toString(),
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
                                            )
                                      );
                                      return;
                                    }
                                    model.choosePack = pack;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  fixedSize: Size(mediaQuery.size.width - 20, 40),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                                    child: Visibility(
                                      visible: true,//!loading,
                                      replacement: const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                      child: const Text(
                                        'choisir',
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
                              ]
                            ),
                          );
                        }
                      )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && !loading) {

                      if (model.choosePack == null) {
                                  
                      
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
                                    "veuillez choisir un Pack de publicité".toString(),
                                    textAlign: TextAlign.center,
                                    maxLines: 20,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.1
                                    ),
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
                          )
                        );
                        return;
                      }
                      model.souscribe();
                      setState(() {
                        next = true;
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
                      visible: true,//!loading,
                      replacement: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Suivant',
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
              
            ],
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: (){
                  Navigator.push(context, 
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  PdfPreviewPage(model.souscription),
                    ),
                  );
                }, 
                icon: Icon(
                  Icons.remove_red_eye_outlined
                ), 
                label: Text(
                  "voir le contrat",
                  style: TextStyle(
                    fontSize: 20
                  ),
                  ),

              ),
              SizedBox(
                height: 10,
              ),
              CheckboxListTile(
                value: model.consentant, 
                onChanged: (value){
                  model.consentant = model.consentant ? false:true;
                  setState(() {
                    
                  });
                },
                title: Text(
                  "Contrat Lu et Approuvé",
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (model.consentant == false) {
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
                                  "Votre consentement est réquis".toString(),
                                  textAlign: TextAlign.center,
                                  maxLines: 20,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.1
                                  ),
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
                        )
                      );
                      return;
                    }else{
                      await AuthService().createSubscribPackPublicitaire(
                          name: model.name,
                          company: model.companyName,
                          cni: model.cardNumber,
                          commerciale: model.commercial,
                          packPublicitaireId: model.choosePack!.id
                      );
                    }
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: Size(mediaQuery.size.width - 20, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: Visibility(
                      visible: true,
                      replacement: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Passer au paiement',
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
            ],
          )

        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
