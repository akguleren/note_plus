import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/app/init/theme/theme_notifier.dart';
import 'package:note_plus/widgets/rich_text/toolbar/rich_text_toolbar.dart';
import '/app/extension/ref_extension.dart';

class RichTextView extends StatefulWidget {
  const RichTextView({
    required this.controller,
    required this.focusNode,
    required this.boxKey,
    required this.hint,
    super.key,
  });
  final QuillController controller;
  final FocusNode focusNode;
  final GlobalKey boxKey;
  final String hint;

  @override
  State<RichTextView> createState() => _RichTextViewState();
}

class _RichTextViewState extends State<RichTextView> {
  final scrollController = ScrollController();
  bool isOpen = false;
  bool showRightButton = true;
  bool showLeftButton = false;
  OverlayEntry? _toolbarOverlay;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 10) {
        setState(() {
          showRightButton = false;
        });
      } else if (scrollController.position.pixels >= 10) {
        setState(() {
          showLeftButton = true;
        });
      } else if (showLeftButton == false || showRightButton == false) {
        setState(() {
          showLeftButton = true;
          showRightButton = true;
        });
      }
    });
  }

  void _onFocusChange() {
    if (widget.focusNode.hasFocus && !isOpen && mounted) {
      // Add a small delay to ensure keyboard is visible
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted && widget.focusNode.hasFocus) {
          _showToolbar();
        }
      });
    } else if (!widget.focusNode.hasFocus && isOpen) {
      _hideToolbar();
    }
  }

  void _showToolbar() {
    if (!mounted) return;

    setState(() {
      isOpen = true;
    });

    _toolbarOverlay = OverlayEntry(
      builder: (overlayContext) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(overlayContext).viewInsets.bottom,
          child: Material(
            elevation: 8,
            child: SafeArea(
              top: false,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(overlayContext).scaffoldBackgroundColor,
                  border: Border(top: BorderSide(color: Theme.of(overlayContext).dividerColor, width: 0.5)),
                ),
                child: RichTextToolbar(controller: widget.controller),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_toolbarOverlay!);
  }

  void _hideToolbar() {
    setState(() {
      isOpen = false;
    });

    _toolbarOverlay?.remove();
    _toolbarOverlay = null;
  }

  @override
  void dispose() {
    _toolbarOverlay?.remove();
    _toolbarOverlay = null;
    widget.focusNode.removeListener(_onFocusChange);
    scrollController.dispose();
    super.dispose();
  }

  void handlePointerDown(BuildContext context, PointerDownEvent event) {
    final box = widget.boxKey.currentContext?.findRenderObject() as RenderBox?;

    if (box != null) {
      final position = box.localToGlobal(Offset.zero);
      final rect = position & box.size;

      if (!rect.contains(event.position)) {
        widget.focusNode.unfocus();
      }
    } else {
      widget.focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Listener(
          onPointerDown: (event) => handlePointerDown(context, event),
          child: GestureDetector(
            onTap: () {
              if (!widget.focusNode.hasFocus) {
                widget.focusNode.requestFocus();
              }
            },
            child: QuillEditor(
              focusNode: widget.focusNode,
              scrollController: scrollController,
              controller: widget.controller,
              config: QuillEditorConfig(
                keyboardAppearance: ref.watch(themeNotifierProvider) == ThemeMode.dark
                    ? Brightness.dark
                    : Brightness.light,
                placeholder: widget.hint,
                customStyles: DefaultStyles(
                  placeHolder: DefaultTextBlockStyle(
                    ref.textTheme.body4.copyWith(color: ref.colorTokens.text!.secondary),
                    HorizontalSpacing.zero,
                    VerticalSpacing.zero,
                    VerticalSpacing.zero,
                    const BoxDecoration(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
