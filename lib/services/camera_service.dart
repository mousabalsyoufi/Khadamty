import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class CameraHelper {
  static final ImagePicker _picker = ImagePicker();

  // Pick File from Gallery [ video or picture ]
 static Future<File?>  pickFileFromGallery() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      // add another extensions here
      allowedExtensions:[...videoExtensions,...photoExtensions]
    );
    if (result != null) {
       file = File(result.files.single.path!);
    }
    return file;
  }
  // take image from camera
  static Future<XFile?> takePhotoFromCamera () async {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      return image;
    }
  // take video from camera
  static Future<XFile?>  takeVideoFromCamera () async {
      final XFile? image = await _picker.pickVideo(source: ImageSource.camera);
      return image;
    }

}
// List contain extensions of videos
List<String> videoExtensions = ['WEBM', 'MPG', 'MP2', 'MPEG', 'MPE', 'MPV','OGG','MP4', 'M4P', 'M4V', 'AVI' ,'WMV' ,'MOV', 'QT' ,'FLV', 'SWF'];
// List contain extensions of images
List<String> photoExtensions = ['jpg','jpeg','png'];