import 'package:flutter/services.dart' show rootBundle;

// Helper file for file operations
class FileHelper {
  static Future<String> readJSONFile(String path) async {
    String fileData = await rootBundle.loadString(
        path); // Read the file from the assets, and  get the contents inside the file as a string
    return fileData;
  }
}
