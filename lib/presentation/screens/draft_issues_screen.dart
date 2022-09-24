import 'package:fix_ms/presentation/widgets/draft_issue_item.dart';
import 'package:fix_ms/presentation/widgets/fix_ms_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftIssuesScreen extends StatelessWidget {
  const DraftIssuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixMSAppBar(
        title: 'Mängel',
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        children: const [
          DraftIssueItem(
            device: 'BikeButton',
            address: 'Hafenplatz 42',
            time: '24.09.22 - 13:37 Uhr',
            category: 'Geh-/Radweg, Radverkehr',
            subCategory: 'starke Verschmutzung/Scherben',
          ),
          DraftIssueItem(
            device: 'WearOS',
            address: 'Schlossalle 666',
            time: '23.09.22 - 04:20 Uhr',
            category: 'Geh-/Radweg, Radverkehr',
            subCategory: 'starke Verschmutzung/Scherben',
          ),
          DraftIssueItem(
            device: 'BikeButton',
            address: 'Siemensstr. 13',
            time: '23.09.22 - 02:42 Uhr',
            category: 'Geh-/Radweg, Radverkehr',
            subCategory: 'starke Verschmutzung/Scherben',
          ),
        ],
      ),
    );
  }
}
