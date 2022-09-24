import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IssueFormAcceptTos extends StatefulWidget {
  final Function(bool) enableNext;

  const IssueFormAcceptTos({
    super.key,
    required this.enableNext,
  });

  @override
  State<IssueFormAcceptTos> createState() => IssueFormAcceptTosState();
}

class IssueFormAcceptTosState extends State<IssueFormAcceptTos> {
  bool acceptTos = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Schritt 4/4: Datenschutzerklärung',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
              'Um den Service der Stadt Münster in Anspruch nehmen zu können, muss der Datenschutzerklärung zugestimmt werden:'),
          TextButton(
            onPressed: () => launchUrl(
                Uri.parse('https://www.stadt-muenster.de/datenschutz')),
            child: const Text(
              'Datenschutzerklärung',
            ),
          ),
          const Text(
              'Datenschutz-Hinweis: Um Ihnen ggf. Rückmeldung geben zu können, werden die Daten ein Jahr gespeichert; anschließend werden sie anonymisiert.'),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Checkbox(
                value: acceptTos,
                onChanged: (val) {
                  setState(() {
                    acceptTos = val ?? false;
                    widget.enableNext(acceptTos);
                  });
                },
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: Text(
                  'Ich habe die Datenschutzerklärung gelesen und bin damit einverstanden',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
