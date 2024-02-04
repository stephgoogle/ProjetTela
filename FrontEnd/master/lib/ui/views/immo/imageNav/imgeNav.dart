import 'package:flutter/material.dart';
import 'package:mobile/ui/views/immo/imageNav/imageNavViewModel.dart';
import 'package:stacked/stacked.dart';

class ImageNav extends StatefulWidget {
  const ImageNav({super.key, this.startIndex = 0, required this.images});
  final int startIndex;
  final List<String> images;

  @override
  State<ImageNav> createState() => _ImageNavState();
}

class _ImageNavState extends State<ImageNav> {
  late PageController _pageController;
  int index = 0;

  static const String _BASE_URL = "http://office.telaci.com/public/";
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.startIndex);
    index = widget.startIndex;
    super.initState();
  }

  void nextPage() {
    if (index < widget.images.length) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      index++;
    }
  }

  void previousPage() {
    if (index > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      index--;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ViewModelBuilder<ImageNavViewModel>.reactive(
      viewModelBuilder: () => ImageNavViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Visites', style: TextStyle(color: Colors.white)),
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
          body: SizedBox(
            width: mq.size.width,
            height: mq.size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: widget.images
                      .map((e) => Image.network(
                            '$_BASE_URL$e',
                            loadingBuilder: (_, Widget child,
                                    ImageChunkEvent? loadingProgress) =>
                                (loadingProgress == null)
                                    ? child
                                    : const Center(
                                        child: CircularProgressIndicator()),
                            errorBuilder: (_, obj, er) => Image.asset(
                              'assets/images/logo.png',
                              width: 50,
                              fit: BoxFit.fitWidth,
                            ),
                            fit: BoxFit.contain,
                          ))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => previousPage(),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.black.withOpacity(0.3),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 32,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => nextPage(),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.black.withOpacity(0.3),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 32,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ))),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
