import 'package:fix_ms/presentation/screens/issue_form_pages/issue_form_choose_category.dart';
import 'package:fix_ms/presentation/widgets/fix_ms_app_bar.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pages = [
      IssueFormChooseCategory(
        enableNext: enableNext,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: curPage != 0 ? () {
                      pageController.previousPage(
                        duration: Duration.zero,
                        curve: const Interval(0, 0),
                      );
                    } : null,
                    child: const Text(
                      'Zurück',
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  ElevatedButton(
                    onPressed: curPage != pages.length - 1 && nextEnabled ? () {
                      pageController.previousPage(
                        duration: Duration.zero,
                        curve: const Interval(0, 0),
                      );
                    } : null,
                    child: const Text(
                      'Weiter',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void enableNext(bool enable) {
    setState(() {
      nextEnabled = true;
    });
  }
}
