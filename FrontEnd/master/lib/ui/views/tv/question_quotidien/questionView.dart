import 'package:flutter/material.dart';
import 'package:mobile/ui/views/tv/question_quotidien/questionViewModel.dart';
import 'package:stacked/stacked.dart';

class QuestionView extends StatefulWidget{
  const QuestionView({super.key});

  @override
  State<QuestionView> createState() => _QuestionView();
}

class _QuestionView extends State<QuestionView> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<QuestionViewModel>.reactive(
        viewModelBuilder: () => QuestionViewModel(),
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
          body: (model.dailyquestion == null) ? const Center(child: Text("Les questions sont momentanements indisponibles"),) : Scrollbar(
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
                          'Bonne chance !',
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Question 1 : ${model.dailyquestion!.question_1}'),
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
                                Icons.edit_note,
                                color:
                                Theme.of(context).colorScheme.primary,
                              ),
                              hintText: "Entrer la reponse ici ",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vous devez entrer une réponse';
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Question 2 : ${model.dailyquestion!.question_2}'),
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
                                Icons.edit_note,
                                color:
                                Theme.of(context).colorScheme.primary,
                              ),
                              hintText: "Entrer la reponse ici ",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vous devez entrer une réponse';
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
                  model.getQuestion().then((value) => {
                  model.saveResponse()
                  });
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