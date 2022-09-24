import 'package:file_picker/file_picker.dart';
import 'package:fix_ms/models/saved_settings.dart';

class IssueFormData {
  late SavedSettings settings;
  late String category;
  late String subCategory;
  PlatformFile? image;
  late String description;

  @override
  String toString() {
    return 'IssueFormData{settings: $settings, category: $category, subCategory: $subCategory, image: $image, description: $description}';
  }
}