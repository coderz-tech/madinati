import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressImage {
  static Future<XFile> compressImage({required XFile file}) async {
    // Get the file path and create a new path for the compressed image
    final String targetPath = file.path.replaceAll('.jpg', '_compressed.jpg');

    // Compress the image
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality:
          90, // Adjust quality to reduce file size without significant loss of quality
    );

    return compressedFile!;
  }
}
