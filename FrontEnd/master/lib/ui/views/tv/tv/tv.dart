import 'package:flutter/material.dart';
import 'package:mobile/models/programetv.dart';
import 'package:mobile/ui/views/tv/tv/tvViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Tv extends StatefulWidget {
  final TelaProgrammeTV programmeTV;
  const Tv({super.key, required this.programmeTV});

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {
  late WebViewController controller;
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
    if (widget.programmeTV.webview) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {
              print('**** ERROR **** $error');
            },
            onNavigationRequest: (NavigationRequest request) {
              // if (request.url.startsWith('https://www.youtube.com/')) {
              //   return NavigationDecision.prevent;
              // }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.programmeTV.link));
    } else {
      videoController =
          VideoPlayerController.networkUrl(Uri.parse(widget.programmeTV.link));

      videoController.addListener(() {
        setState(() {});
      });
      videoController.setLooping(true);
      videoController.seekTo(const Duration(seconds: 15));
      videoController.initialize().then((_) => setState(() {}));
      videoController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TvViewModel>.reactive(
      viewModelBuilder: () => TvViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Center(
          child: widget.programmeTV.webview
              ? WebViewWidget(
                  controller: controller,
                  key: UniqueKey(),
                )
              : Center(
                  child: AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,
                      child: VideoPlayer(
                        videoController,
                        key: UniqueKey(),
                      )),
                ),
        )),
        floatingActionButton: widget.programmeTV.webview
            ? null
            : FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  setState(() {
                    videoController.value.isPlaying
                        ? videoController.pause()
                        : videoController.play();
                  });
                },
                child: Icon(
                  videoController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }
}
