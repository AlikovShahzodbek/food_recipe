import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/home_page/filter.dart';
import 'package:practick_project/components/main_screen/home_page/searcher.dart';
import 'package:practick_project/routes/home_page_routes.dart';

class SearcherAndFilter extends StatelessWidget {
  const SearcherAndFilter({super.key, required this.readOnly});
  final bool readOnly;

  void goSearchPage(BuildContext context) {
    Navigator.of(context).pushNamed(HomePageRoutes.search);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: readOnly
              ? InkWell(
                  onTap: () => goSearchPage(context),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: AbsorbPointer(child: Searcher(readOnly: true)),
                )
              : Searcher(readOnly: readOnly),
        ),
        SizedBox(width: 20),
        Filter(),
      ],
    );
  }
}
