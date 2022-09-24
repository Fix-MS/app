import 'package:fix_ms/models/issue_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class IssueFormChooseCategory extends StatefulWidget {
  final Function(bool) enableNext;
  final Function(String, String) saveCategories;

  const IssueFormChooseCategory({
    super.key,
    required this.enableNext,
    required this.saveCategories,
  });

  @override
  State<IssueFormChooseCategory> createState() =>
      IssueFormChooseCategoryState();
}

class IssueFormChooseCategoryState extends State<IssueFormChooseCategory> {
  String? category = 'Geh-/Radweg, Radverkehr';
  String? subCategory = 'starke Verschmutzung/Scherben';
  int interActiveFlags = InteractiveFlag.all;

  @override
  Widget build(BuildContext context) {
    widget.enableNext(category != null && subCategory != null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 220,
          child: FlutterMap(
            options: MapOptions(
              center:
              LatLng(51.956789, 7.628728),
              zoom: 18,
              interactiveFlags: interActiveFlags,
            ),
            children: [
              TileLayer(
                urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(51.956789, 7.628728),
                    width: 80,
                    height: 80,
                    builder: (context) => const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Schritt 1/4: Was war\'s?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonFormField(
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Kategorie',
            ),
            items: IssueCategories.categoriesMap.keys
                .map(
                  (cat) => DropdownMenuItem(
                    value: cat,
                    child: Text(cat),
                  ),
                )
                .toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  subCategory = null;
                  category = val;
                });
              }
            },
            value: category,
          ),
        ),
        if (category != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: DropdownButtonFormField(
              isExpanded: true,
              value: subCategory,
              decoration: const InputDecoration(
                labelText: 'Unterkategorie',
              ),
              items: (IssueCategories.categoriesMap[category] ?? [])
                  .map(
                    (subCat) => DropdownMenuItem(
                      value: subCat,
                      child: Text(
                        subCat,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    subCategory = val;
                  });
                  widget.saveCategories(category!, subCategory!);
                }
              },
            ),
          ),
      ],
    );
  }
}
