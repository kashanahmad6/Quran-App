import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/consts.dart/consts.dart';
import 'package:quran_app/provider/api_provider.dart';

import 'package:quran_app/provider/search_bar_provider.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchBarProvider>(context, listen: true);

    return state.showSearchField ? searchField() : searchicon();
  }

  Widget searchField() {
    return Container(
      decoration: BoxDecoration(
        color: fillcolor,
        borderRadius: BorderRadius.circular(35),
      ),
      width: 265,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          onChanged: (value) {
            Provider.of<ApiProvider>(context, listen: false).search(value);
          },
          decoration: InputDecoration(
            hintText: 'Search..',
            border: InputBorder.none,
            suffix: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: clearButton(),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchicon() {
    return Expanded(
        child: Container(
      alignment: Alignment.centerRight,
      height: 35,
      decoration: BoxDecoration(
        color: fillcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          Provider.of<SearchBarProvider>(context, listen: false).toggleSearh();
        },
        icon: const Icon(Icons.search),
      ),
    ));
  }

  Widget clearButton() {
    return IconButton(
      onPressed: () {
        Provider.of<SearchBarProvider>(context, listen: false).toggleSearh();
        Provider.of<ApiProvider>(context, listen: false).search('');
      },
      icon: const Icon(
        Icons.close_outlined,
        size: 20,
        color: Colors.black,
      ),
    );
  }
}
