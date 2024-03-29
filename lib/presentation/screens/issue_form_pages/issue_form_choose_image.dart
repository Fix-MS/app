import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class IssueFormChooseImage extends StatefulWidget {
  final Function(bool) enableNext;
  final Function(PlatformFile? image) saveImage;

  const IssueFormChooseImage({
    super.key,
    required this.enableNext,
    required this.saveImage,
  });

  @override
  State<IssueFormChooseImage> createState() => IssueFormChooseImageState();
}

class IssueFormChooseImageState extends State<IssueFormChooseImage>
    with AutomaticKeepAliveClientMixin<IssueFormChooseImage> {
  PlatformFile? file;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    widget.enableNext(true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Schritt 2/4: Wenn Du möchtest, kannst Du hier ein Foto hochladen:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                      withData: true,
                    );
                    if (result != null) {
                      setState(() {
                        file = result.files.first;
                        widget.saveImage(file);
                      });
                    }
                  },
                  child: const Text(
                    'Wähle Foto',
                  ),
                ),
                const SizedBox(width: 8),
                if (file != null)
                  Expanded(
                    child: Text(
                      file!.name,
                    ),
                  ),
              ],
            ),
          ),
          if (file != null)
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.memory(file!.bytes!),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
