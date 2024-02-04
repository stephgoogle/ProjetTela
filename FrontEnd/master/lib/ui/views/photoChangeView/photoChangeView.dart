import 'package:flutter/material.dart';
import 'package:mobile/ui/views/photoChangeView/photoChangeViewModel.dart';
import 'package:stacked/stacked.dart';

/// Created by Laty 26 PHARAHON entertainment on 17/09/2020.
// home widget
class PhotoChangeView extends StatefulWidget {
  const PhotoChangeView({super.key, required this.fromBank});
  final bool fromBank;

  @override
  _PhotoChangeViewState createState() => _PhotoChangeViewState();
}

class _PhotoChangeViewState extends State<PhotoChangeView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isPasswordVisible = false;
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;
  bool loading = false;
  static const String _BASE_URL = "http://office.telaci.com/public/";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<PhotoChangeViewModel>.reactive(
        viewModelBuilder: () => PhotoChangeViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title:
                    const Text('Photo', style: TextStyle(color: Colors.white)),
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
                                'Vous pouvez modifier votre photo.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            /// photo
                            const Divider(),
                            const Text(
                              'Photo',
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
                                child: model.photo != null
                                    ? Image.file(
                                        model.photo!,
                                        fit: BoxFit.contain,
                                      )
                                    : Image.network(
                                        '$_BASE_URL${model.authService.user?.photo}',
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
                                        fit: BoxFit.contain,
                                      ),
                                onTap: () async {
                                  await model.pickPhoto().whenComplete(() {
                                    setState(() {});
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
                                        'Êtes vous sur de vouloir remplacer votre photo de profil?',
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
                                                    .changePhoto()
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
                        'Changer votre photo',
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
