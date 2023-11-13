import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? image = await imagePicker.pickImage(source: source);

  if (image != null) {
    return await image.readAsBytes();
  }

  return null;
}
