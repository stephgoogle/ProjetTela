import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/ui/views/camera/cameraViewModel.dart';
import 'package:stacked/stacked.dart';

/// Created by Laty 26 PHARAHON entertainment on 13/09/2021.
class CaptureView extends StatefulWidget {
  final File image;

  const CaptureView({super.key, required this.image});

  @override
  _CaptureViewState createState() => _CaptureViewState();
}

class _CaptureViewState extends State<CaptureView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CameraViewModel>.reactive(
        viewModelBuilder: () => CameraViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(widget.image),
                    fit: BoxFit.contain,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(false),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.black.withOpacity(0.3),
                                      child: const Icon(
                                        Icons.close,
                                        size: 32,
                                        color: Colors.red,
                                      ))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.black.withOpacity(0.3),
                                      child: Icon(
                                        Icons.check,
                                        size: 32,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ))),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
