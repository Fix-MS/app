import 'package:fix_ms/presentation/widgets/draft_issue_item.dart';
import 'package:fix_ms/presentation/widgets/fix_ms_app_bar.dart';
import 'package:flutter/material.dart';

class DraftIssuesScreen extends StatefulWidget {

  const DraftIssuesScreen({super.key});

  @override
  State<DraftIssuesScreen> createState() => _DraftIssuesScreenState();
}

class _DraftIssuesScreenState extends State<DraftIssuesScreen> {
  late final DateTime fakeTime;

  @override
  void initState() {
    super.initState();
    fakeTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixMSAppBar(
        title: 'Mängel',
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        children: [
          DraftIssueItem(
            device: 'BikeButton',
            address: 'Promenade',
            time: '24.09.22 - ${fakeTime.hour}:${fakeTime.minute} Uhr',
            category: 'Geh-/Radweg, Radverkehr',
            subCategory: 'starke Verschmutzung/Scherben',
          ),
          const DraftIssueItem(
            device: 'WearOS',
            address: 'Münzstraße 16',
            time: '23.09.22 - 13:37 Uhr',
            category: 'Beleuchtung',
            subCategory: 'Leuchtenmast beschädigt',
          ),
          const DraftIssueItem(
            device: 'BikeButton',
            address: 'Hafenplatz 1',
            time: '23.09.22 - 08:42 Uhr',
            category: 'Geh-/Radweg, Radverkehr',
            subCategory: 'starke Verschmutzung/Scherben',
          ),
        ],
      ),
    );
  }
}
