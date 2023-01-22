import 'package:flutter/material.dart';

class IssueFormAddDescription extends StatefulWidget {
  final Function(bool) enableNext;
  final Function(String) saveDescription;

  const IssueFormAddDescription({
    super.key,
    required this.enableNext,
    required this.saveDescription,
  });

  @override
  State<IssueFormAddDescription> createState() =>
      IssueFormAddDescriptionState();
}

class IssueFormAddDescriptionState extends State<IssueFormAddDescription>
    with AutomaticKeepAliveClientMixin<IssueFormAddDescription> {
  String description = '';

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
            'Schritt 3/4: Hast Du Anmerkungen oder eine Beschreibung des Mangels?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            minLines: 6,
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Anmerkungen',
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onChanged: (val) {
              description = val;
              widget.saveDescription(description);
            },
          )
        ],
      ),
    );
  }
}
