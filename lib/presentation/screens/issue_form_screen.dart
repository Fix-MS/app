import 'package:fix_ms/models/issue_form_data.dart';
import 'package:fix_ms/presentation/screens/issue_form_pages/issue_form_accept_tos.dart';
import 'package:fix_ms/presentation/screens/issue_form_pages/issue_form_add_description.dart';
import 'package:fix_ms/presentation/screens/issue_form_pages/issue_form_choose_category.dart';
import 'package:fix_ms/presentation/screens/issue_form_pages/issue_form_choose_image.dart';
import 'package:fix_ms/presentation/widgets/fix_ms_app_bar.dart';
import 'package:fix_ms/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class IssueFormScreen extends StatefulWidget {
  const IssueFormScreen({super.key});

  @override
  State<IssueFormScreen> createState() => IssueFormScreenState();
}

class IssueFormScreenState extends State<IssueFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final PageController pageController;
  int curPage = 0;
  bool nextEnabled = false;

  late final List<Widget> pages;
  IssueFormData formData = IssueFormData();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pages = [
      IssueFormChooseCategory(
        enableNext: enableNext,
        saveCategories: (cat, subCat) {
          formData.category = cat;
          formData.subCategory = subCat;
        },
      ),
      IssueFormChooseImage(
        enableNext: enableNext,
        saveImage: (image) {
          formData.image = image;
        },
      ),
      IssueFormAddDescription(
        enableNext: enableNext,
        saveDescription: (description) {
          formData.description = description;
        },
      ),
      IssueFormAcceptTos(
        enableNext: enableNext,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = curPage == pages.length - 1;
    return Scaffold(
      appBar: FixMSAppBar(
        title: 'Mängelmeldung',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  children: pages,
                  onPageChanged: (curPage) {
                    setState(() {
                      this.curPage = curPage;
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: curPage != 0
                            ? () {
                                pageController.previousPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: const Interval(0, 1),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.redAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          minimumSize: const Size(0, 80),
                        ),
                        child: const Text(
                          'Zurück',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (curPage != pages.length - 1)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: nextEnabled
                              ? () {
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: const Interval(0, 1),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.redAccent,
                            elevation: 3,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            minimumSize: const Size(0, 80),
                          ),
                          child: const Text(
                            'Weiter',
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: ElevatedButton(
                          onPressed: nextEnabled
                              ? () async {
                                  // TODO: Submit to backend
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    formData.settings = await GetIt.I
                                        .get<StorageService>()
                                        .loadSettings();
                                    print(formData);
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.redAccent,
                            elevation: 3,
  
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            minimumSize: const Size(0, 80),
                          ),
                          child: const Text(
                            'Weiter',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void enableNext(bool enable) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        nextEnabled = enable;
      });
    });
  }
}
