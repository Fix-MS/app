import 'package:fix_ms/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftIssueItem extends StatelessWidget {
  final String device;
  final String address;
  final String time;
  final String category;
  final String subCategory;

  const DraftIssueItem({
    super.key,
    required this.device,
    required this.address,
    required this.time,
    required this.category,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.form);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8, top: 2, left: 2),
                child: Icon(
                  Icons.edit,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      category,
                    ),
                    Text(
                      subCategory,
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      device,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
