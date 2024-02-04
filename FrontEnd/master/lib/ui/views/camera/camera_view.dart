import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app/app.locator.dart';
import 'package:mobile/services/telaSharedPrefs.dart';
import 'package:mobile/ui/views/camera/cameraViewModel.dart';
import 'package:stacked/stacked.dart';

/// Created by Laty 26 PHARAHON entertainment on 15/09/2021.
class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final TelaSharedPrefs _telaSharedPrefs = locator<TelaSharedPrefs>();

  late CameraController _cameraController;

  late final List<CameraDescription> cameras;
  late Future<void> _cameraInitialization;
  int selectedCamera = 0;
  bool _flash = false;
  late File image;

  initCamera(int cam) async {
    cameras = _telaSharedPrefs.cameras;

    _cameraController = CameraController(cameras[cam], ResolutionPreset.high);
    _cameraInitialization = _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    _cameraController.setFlashMode(FlashMode.off);
  }

  cam(int cam) async {
    _cameraController = CameraController(cameras[cam], ResolutionPreset.high);
    _cameraInitialization = _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    _cameraController.setFlashMode(FlashMode.off);
  }

  @override
  void initState() {
    initCamera(selectedCamera);
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CameraViewModel>.reactive(
      viewModelBuilder: () => CameraViewModel(),
      builder: (context, model, child) => Scaffold(
        extendBodyBehindAppBar: false,
        body: SafeArea(
          child: Stack(
            children: [
              FutureBuilder<void>(
                future: _cameraInitialization,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: CameraPreview(_cameraController));
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () => setState(() {
                            _flash = !_flash;
                            _flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          }),
                          icon: Icon(_flash ? Icons.flash_on : Icons.flash_off,
                              color: _flash ? Colors.yellow : Colors.grey),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///SWITCH CAMERA
                          IconButton(
                            onPressed: () async {
                              if (cameras.length > 1) {
                                selectedCamera = selectedCamera == 0 ? 1 : 0;
                                await cam(selectedCamera);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Pas de seconde camera trouvé'),
                                  duration: Duration(seconds: 2),
                                ));
                              }
                            },
                            icon: Icon(Icons.switch_camera_rounded,
                                color: Theme.of(context).colorScheme.primary),
                          ),

                          /// CAPTURE BUTTON
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.primary,
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 3.0)),
                            child: InkWell(
                              onTap: () async {
                                await _cameraInitialization; //To make sure camera is initialized
                                var xFile =
                                    await _cameraController.takePicture();

                                // final ass = await getImageFileFromAssets('cnib.jpeg');
                                image = File(xFile.path);
                                model.navigateToCapture(image);
                              },
                              splashColor: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(50),
                              customBorder: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),

                          /// Galery
                          IconButton(
                            onPressed: () => setState(() {
                              model.pickImage();
                            }),
                            icon: Icon(
                              Icons.image_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
