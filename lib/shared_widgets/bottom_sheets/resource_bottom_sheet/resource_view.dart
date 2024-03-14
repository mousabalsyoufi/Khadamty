import 'package:faciltateur_de_vies/services/camera_service.dart';
import 'package:flutter/material.dart';

class ResourceBottomSheetView extends StatelessWidget {
  const ResourceBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: () {
              CameraHelper.pickFileFromGallery();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.image),
                Flexible(
                    child: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 10),
                ))
              ],
            )),
        InkWell(
            onTap: () {
              CameraHelper.takeVideoFromCamera();
              },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.video_camera_back_sharp),
                Flexible(
                    child: Text(
                      "Video",
                      style: TextStyle(fontSize: 10),
                    ))
              ],
            )),
        InkWell(
            onTap: () {
              CameraHelper.takePhotoFromCamera();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.photo_camera),
                Flexible(
                    child: Text(
                      "Photo",
                      style: TextStyle(fontSize: 10),
                    ))
              ],
            )),
      ],
    );
  }
}
