import 'package:flutter/material.dart';
import 'package:keymo_flutter/core/theme.dart';

class WordlistViewWidget extends StatefulWidget {
  const WordlistViewWidget({Key? key, required this.wordList}) : super(key: key);

  final List<String> wordList;

  @override
  State<WordlistViewWidget> createState() => _WordlistViewWidgetState();
}

class _WordlistViewWidgetState extends State<WordlistViewWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else if (_animationController.isDismissed) {
        _animationController.forward();
      }
    });

    _animation = Tween<double>(begin: 0, end: 80).animate(_animationController);
    _animation.addListener(() => setState(() {}));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.wordList.length,
      itemBuilder: (context, idx) {
        return Padding(
          padding: (idx % 2 == 0) ? EdgeInsets.only(left: _animation.value) : EdgeInsets.only(right: _animation.value),
          child: Align(
            alignment: (idx % 2 == 0) ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.wordList.removeAt(idx);
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: WordTagWidget(word: widget.wordList[idx]),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WordTagWidget extends StatelessWidget {
  const WordTagWidget({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Text(word, style: kLargeTextStyle)),
          const SizedBox(width: 5),
          Text('X', style: kLargeTextStyle.copyWith(color: Theme.of(context).primaryColor)),
        ],
      ),
    );
  }
}
