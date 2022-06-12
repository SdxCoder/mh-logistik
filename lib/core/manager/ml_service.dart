import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mh_logistik/core/utils/logger.dart';


/// Service to scan the text
class MLService {

  static Future<String> getText({required String path}) async {
    //
    final inputImage = InputImage.fromFilePath(path);
    //
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    //
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    await textRecognizer.close();

    String text = '';

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          text = "$text ${element.text}";
        }
      }
    }

    logger.d(text);

    return text;
  }

}
