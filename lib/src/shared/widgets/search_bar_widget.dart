import 'package:corelab_app_challenge/src/shared/theme/app_colors.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final VoidCallback? onPressedClearButton;
  final Function(String? value) onChanged;
  final Function(String? value) onSubmitted;
  final Function(bool? hasFocus) onFocusChanged;
  final FocusNode focus;
  final TextEditingController textEditingController;

  const SearchBarWidget({
    super.key,
    required this.onPressedClearButton,
    required this.onChanged,
    required this.onSubmitted,
    required this.onFocusChanged,
    required this.focus,
    required this.textEditingController,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool inSearch = false;

  @override
  void initState() {
    super.initState();
    widget.focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focus.removeListener(_onFocusChange);
    widget.focus.dispose();
  }

  void _onFocusChange() {
    widget.onFocusChanged(widget.focus.hasFocus);
    if (!widget.focus.hasFocus && widget.textEditingController.text.isEmpty) {
      setState(() {
        inSearch = false;
      });
    } else {
      setState(() {
        inSearch = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        widget.onChanged(text);
      },
      onSubmitted: (text) {
        widget.onSubmitted(text);
      },
      focusNode: widget.focus,
      textInputAction: TextInputAction.search,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        hintText: 'Buscar',
        hintStyle: AppTypography().textHintSearchBar,

        // Add a clear button to the search bar
        suffixIcon: hidingIconClear(),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  Widget? hidingIconClear() {
    if (inSearch) {
      return IconButton(
        icon: ImageIcon(
          const AssetImage('assets/icons/search_bar/close.png'),
          color: AppColors().textGray,
        ),
        onPressed: () {
          if (widget.onPressedClearButton != null) {
            widget.onPressedClearButton!();
          }
          setState(() {
            widget.textEditingController.clear();
            inSearch = false;
          });
        },
      );
    } else {
      return IconButton(
        icon: ImageIcon(
          const AssetImage("assets/icons/search_bar/search.png"),
          color: AppColors().textLightBlue,
          size: 23.0,
        ),
        onPressed: () {},
      );
    }
  }
}
