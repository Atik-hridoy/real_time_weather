import 'package:flutter/material.dart';

class AnimSearchBar extends StatefulWidget {
  final bool rtl;
  final double width;
  final Color color;
  final TextEditingController textController;
  final Icon suffixIcon;
  final VoidCallback onSuffixTap;
  final TextStyle style;

  AnimSearchBar({
    required this.rtl,
    required this.width,
    required this.color,
    required this.textController,
    required this.suffixIcon,
    required this.onSuffixTap,
    required this.style,
  });

  @override
  _AnimSearchBarState createState() => _AnimSearchBarState();
}

class _AnimSearchBarState extends State<AnimSearchBar> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
          Expanded(
            child: TextField(
              controller: widget.textController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
              style: widget.style,
              onChanged: (value) {
                // Handle search text changes
              },
              onTap: () {
                setState(() {
                  _isFocused = true;
                });
              },
              onSubmitted: (value) {
                // Handle search submission
                setState(() {
                  _isFocused = false;
                });
              },
            ),
          ),
          GestureDetector(
            onTap: widget.onSuffixTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: widget.suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
