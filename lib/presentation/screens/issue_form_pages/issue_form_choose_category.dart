import 'package:fix_ms/models/issue_categories.dart';
import 'package:flutter/material.dart';

class IssueFormChooseCategory extends StatefulWidget {
  final Function(bool) enableNext;
  final Function(String, String) saveCategories;
  
  const IssueFormChooseCategory({
    super.key,
    required this.enableNext,
    required this.saveCategories,
  });
  
  @override
  State<IssueFormChooseCategory> createState() => IssueFormChooseCategoryState();
}

class IssueFormChooseCategoryState extends State<IssueFormChooseCategory> {
  String? category;
  String? subCategory;

  @override
  Widget build(BuildContext context) {
    widget.enableNext(category != null && subCategory != null);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Schritt 1/4: Was hast Du gesehen?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          DropdownButtonFormField(
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Kategorie',
            ),
            items: IssueCategories.categoriesMap.keys.map(
              (cat) => DropdownMenuItem(
                value: cat,
                child: Text(cat),
              ),
            ).toList(),
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
          if (category != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: DropdownButtonFormField(
                isExpanded: true,
                value: subCategory,
                decoration: const InputDecoration(
                  labelText: 'Unterkategorie',
                ),
                items: (IssueCategories.categoriesMap[category] ?? []).map(
                  (subCat) => DropdownMenuItem(
                    value: subCat,
                    child: Text(
                      subCat,
                    ),
                  ),
                ).toList(),
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
      ),
    );
  }
}
