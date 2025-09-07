import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/widgets/rich_text/toolbar/top_menu_dropdown.dart';
import '/app/extension/ref_extension.dart';

class RichTextToolbar extends ConsumerStatefulWidget {
  const RichTextToolbar({required this.controller, super.key});
  final QuillController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RichTextToolbarState();
}

class _RichTextToolbarState extends ConsumerState<RichTextToolbar> {
  final scrollController = ScrollController();
  bool showLeftButton = false;
  bool showRightButton = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 10) {
        setState(() {
          showRightButton = false;
        });
      } else {
        setState(() {
          showRightButton = true;
        });
      }
      if (scrollController.position.pixels < 10) {
        setState(() {
          showLeftButton = false;
        });
      } else {
        setState(() {
          showLeftButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: Row(
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        child: Row(
                          children: [
                            QuillToolbarHistoryButton(
                              isUndo: true,

                              controller: widget.controller,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarHistoryButton(
                              isUndo: false,
                              options: QuillToolbarHistoryButtonOptions(
                                iconTheme: QuillIconTheme(
                                  iconButtonSelectedData: IconButtonData(color: ref.colorTokens.text?.primary),
                                  iconButtonUnselectedData: IconButtonData(color: ref.colorTokens.surface?.stroke),
                                ),
                              ),
                              controller: widget.controller,
                              baseOptions: _baseOptions,
                            ),
                            VerticalDivider(
                              indent: 5,
                              endIndent: 5,
                              thickness: 1,
                              color: ref.colorTokens.surface?.stroke,
                            ),
                            QuillToolbarToggleStyleButton(
                              controller: widget.controller,
                              attribute: Attribute.bold,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarToggleStyleButton(
                              controller: widget.controller,
                              attribute: Attribute.italic,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarToggleStyleButton(
                              controller: widget.controller,
                              attribute: Attribute.underline,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarClearFormatButton(controller: widget.controller, baseOptions: _baseOptions),
                            VerticalDivider(
                              indent: 5,
                              endIndent: 5,
                              thickness: 1,
                              color: ref.colorTokens.surface?.stroke,
                            ),
                            QuillToolbarFontSizeButton(controller: widget.controller, baseOptions: _baseOptions),
                            VerticalDivider(
                              indent: 5,
                              endIndent: 5,
                              thickness: 1,
                              color: ref.colorTokens.surface?.stroke,
                            ),
                            QuillToolbarToggleCheckListButton(controller: widget.controller, baseOptions: _baseOptions),

                            VerticalDivider(
                              indent: 5,
                              endIndent: 5,
                              thickness: 1,
                              color: ref.colorTokens.surface?.stroke,
                            ),
                            QuillToolbarColorButton(
                              controller: widget.controller,
                              isBackground: false,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarColorButton(
                              controller: widget.controller,
                              isBackground: true,
                              baseOptions: _baseOptions,
                            ),
                            VerticalDivider(
                              indent: 5,
                              endIndent: 5,
                              thickness: 1,
                              color: ref.colorTokens.surface?.stroke,
                            ),
                            QuillToolbarToggleStyleButton(
                              controller: widget.controller,
                              attribute: Attribute.ol,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarToggleStyleButton(
                              controller: widget.controller,
                              attribute: Attribute.ul,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarIndentButton(
                              controller: widget.controller,
                              isIncrease: true,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarIndentButton(
                              controller: widget.controller,
                              isIncrease: false,
                              baseOptions: _baseOptions,
                            ),
                            VerticalDivider(
                              indent: 5,
                              endIndent: 5,
                              thickness: 1,
                              color: ref.colorTokens.surface?.stroke,
                            ),
                            QuillToolbarToggleStyleButton(
                              controller: widget.controller,
                              attribute: Attribute.inlineCode,
                              baseOptions: _baseOptions,
                            ),
                            QuillToolbarLinkStyleButton(controller: widget.controller, baseOptions: _baseOptions),
                          ],
                        ),
                      ),
                      if (showLeftButton)
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              boxShadow: [BoxShadow(color: ref.colorTokens.background!.bgIcon!, blurRadius: 5)],
                            ),
                            child: const Icon(Icons.chevron_left, size: 15),
                          ),
                        )
                      else
                        const SizedBox(),
                      if (showRightButton)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              boxShadow: [BoxShadow(color: ref.colorTokens.background!.bgIcon!, blurRadius: 5)],
                            ),
                            child: const Icon(Icons.chevron_right, size: 15),
                          ),
                        )
                      else
                        const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  QuillToolbarBaseButtonOptions get _baseOptions => QuillToolbarBaseButtonOptions(
    iconTheme: QuillIconTheme(
      iconButtonSelectedData: IconButtonData(color: ref.colorTokens.text?.primary),
      iconButtonUnselectedData: IconButtonData(color: ref.colorTokens.surface?.stroke),
    ),
  );
}

extension FontSizeEnum on String {
  String? get toFontSizeText {
    switch (this) {
      case '14':
        return 'General.Small';
      case '16':
        return 'General.Medium';
      case '18':
        return 'General.Large';
      default:
        return null;
    }
  }
}
