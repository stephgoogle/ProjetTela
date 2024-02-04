
import 'package:flutter/material.dart';
import 'package:mobile/ui/views/tv/add_question_quotidien/addQuestionViewModel.dart';
import 'package:stacked/stacked.dart';

class AddQuestionView extends StatefulWidget{
  const AddQuestionView({super.key});
  @override
  State<AddQuestionView>createState() => _AddQuestionView();
}

class _AddQuestionView extends State<AddQuestionView> with TickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
  }

  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<AddQuestionViewModel>.reactive(
        viewModelBuilder: () => AddQuestionViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Question du jour',
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          'Ajouter les questions du jour',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        /// Question 1
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Q1"),
                        ),

                        /// question 1 field
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
                              hintText: "Entrer la première question ",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vous devez entrer une question';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              model.question_1 = value;
                            },
                          ),
                        ),


                        const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),

                        /// Reponse à la question 1
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Reponse Q1"),
                        ),

                        /// question 1 response field
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
                              hintText: "Entrer la reponse  ici ",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vous devez entrer une reponse';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              model.response_1 = value;
                            },
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),

                        /// Question 2
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Q2"),
                        ),

                        /// question 2 field
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
                              hintText: "Entrer la deuxième question ",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vous devez entrer une question';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              model.question_2 = value;
                            },
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Reponse Q2"),
                        ),

                        /// question 2 response field
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
                              hintText: "Entrer la reponse  ici ",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vous devez entrer une question';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              model.response_2 = value;
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
                if(_formKey.currentState!.validate()){
                  model.saveDailyQuestion();
                   ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(
                         backgroundColor: Colors.white,
                         content: Text("Question ajouter avec succès"),
                       )
                   );
                  model.navigateToAcceuil();
                }
              },
              style: ElevatedButton.styleFrom(
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
                    'Valider',
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