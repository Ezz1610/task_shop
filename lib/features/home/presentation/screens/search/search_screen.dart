import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/core/app_utils/app_strings.dart';

class SearchScreen extends StatelessWidget {

  static const id = AppStrings.searchScreen;

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search"
        ),
      ),
      body: const Center(
        child: Text(
            "SearchScreen"
        ),
      ),
    );
  }
}
