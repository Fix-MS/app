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
  State<IssueFormAddDescription> createState() => IssueFormAddDescriptionState();
}

class IssueFormAddDescriptionState extends State<IssueFormAddDescription> {
  String description = '';

  @override
  Widget build(BuildContext context) {
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
          TextFormField(
            minLines: 6,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Anmerkungen',
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
