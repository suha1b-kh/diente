import 'package:flutter/material.dart';

void main() => runApp(const SearchStudentBar());

class SearchStudentBar extends StatefulWidget {
  const SearchStudentBar({super.key});

  @override
  State<SearchStudentBar> createState() => _SearchStudentBarState();
}

class _SearchStudentBarState extends State<SearchStudentBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            backgroundColor: WidgetStateProperty.all(const Color(0xFFF2F4F7)), // Background color
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {//item to suggestion in searchbar
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        },
      ),
    );
  }
}