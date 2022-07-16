import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keymo_flutter/core/provider.dart';
import 'package:keymo_flutter/core/theme.dart';
import 'package:keymo_flutter/model/keyword.dart';
import 'package:keymo_flutter/model/user.dart';
import 'package:keymo_flutter/view/component/my_appbar.dart';
import 'package:keymo_flutter/view/component/wordlist_view_widget.dart';

class AddKeywordView extends ConsumerStatefulWidget {
  const AddKeywordView({Key? key}) : super(key: key);

  static const String id = "AddKeywordView";

  @override
  ConsumerState<AddKeywordView> createState() => _AddKeywordViewState();
}

class _AddKeywordViewState extends ConsumerState<AddKeywordView> {
  late TextEditingController keywordController;
  late TextEditingController titleController;
  List<String> wordList = [];

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    keywordController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "주제",
                labelStyle: kLargeTextStyle,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: keywordController,
              decoration: const InputDecoration(
                labelText: "키워드를 입력해주세요.",
                labelStyle: kLargeTextStyle,
              ),
              onSubmitted: (value) {
                if (value.trim().isEmpty) return;
                setState(() {
                  wordList.add(value);
                  keywordController.text = "";
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(child: WordlistViewWidget(wordList: wordList)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () {
          final title = titleController.text.trim();

          if (title.trim().isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('주제를 입력해주세요!')));
            return;
          }
          if (wordList.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('최소 한 개 이상의 키워드를 입력해주세요!')));
            return;
          }

          final keyword = Keyword(title: title, wordList: wordList, pubDate: DateTime.now());
          final keywordList = ref.read(userProvider).keywordList;
          keywordList.add(keyword);
          ref.read(userProvider.state).state = User(keywordList: keywordList);

          Navigator.pop(context);
        },
      ),
    );
  }
}
