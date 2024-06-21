import 'dart:developer';

import 'package:camerakit_flutter/camerakit_flutter.dart';
import 'package:camerakit_flutter/lens_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:meta/meta.dart';

part 'camera_kit_state.dart';

class CameraKitCubit extends Cubit<CameraKitState> with CameraKitFlutterEvents {
  CameraKitCubit() : super(CameraKitInitial());
  static CameraKitCubit get(context) => BlocProvider.of(context);

  late final _cameraKitFlutterImpl =
      CameraKitFlutterImpl(cameraKitFlutterEvents: this);

  Future<void> initCameraKit() async {
    await _cameraKitFlutterImpl.setCredentials(
        apiToken:
            'eyJhbGciOiJIUzI1NiIsImtpZCI6IkNhbnZhc1MyU0hNQUNQcm9kIiwidHlwIjoiSldUIn0.eyJhdWQiOiJjYW52YXMtY2FudmFzYXBpIiwiaXNzIjoiY2FudmFzLXMyc3Rva2VuIiwibmJmIjoxNzE2NTA4MzM1LCJzdWIiOiI4ZTJjYTE4Zi1iYTg0LTQ0Y2QtOWVhNS04NTc2YjBhM2FkYTd-U1RBR0lOR34wODE0NThhZi0xNGFjLTQ3ODQtOTc3NS1lNzBhMzExODYxNDQifQ.8QpmygwDYF7eIlxO6ti_9NSSEqHyHuB4Pk8OznCZg9A');
  }

  Future<void> openCameraKit() async {
    try {
      await _cameraKitFlutterImpl.openCameraKit(
        groupIds: ['3294879e-e5e6-457b-9b29-7fd204bbaeb1'],
        isHideCloseButton: false,
      );
    } on PlatformException {
      log("Failed to open camera");
    }
  }

  Future<void> openSingleLens(String lensId) async {
    try {
      await _cameraKitFlutterImpl.openCameraKitWithSingleLens(
        groupId: '3294879e-e5e6-457b-9b29-7fd204bbaeb1',
        lensId: lensId,
        isHideCloseButton: false,
      );
    } on PlatformException {
      log("Failed to open camera");
    }
  }

  @override
  Future<void> onCameraKitResult(Map<dynamic, dynamic> result) async {
    if (result["type"] == 'image') {
      await GallerySaver.saveImage(result["path"], albumName: 'Prova 3D');
    } else if (result["type"] == 'video') {
      await GallerySaver.saveVideo(result["path"], albumName: 'Prova 3D');
    }
  }

  @override
  void receivedLenses(List<Lens> lensList) {
    // TODO: implement receivedLenses
  }
}
