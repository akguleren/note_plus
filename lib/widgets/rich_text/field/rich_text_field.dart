import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/widgets/rich_text/view/rich_text_view.dart';
import '/app/extension/ref_extension.dart';

class RichTextField extends ConsumerStatefulWidget {
  final FormFieldState<dynamic> field;
  final QuillController controller;
  final FocusNode focusNode;
  final GlobalKey boxKey;
  final String hint;
  const RichTextField({
    required this.focusNode,
    required this.field,
    required this.controller,
    required this.boxKey,
    required this.hint,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RichTextFieldState();
}

class _RichTextFieldState extends ConsumerState<RichTextField> {
  late VoidCallback _controllerListener;

  @override
  void initState() {
    super.initState();
    _controllerListener = () {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            widget.field.didChange(widget.controller.document);
          }
        });
      }
    };
    widget.controller.addListener(_controllerListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: RichTextView(
              boxKey: widget.boxKey,
              controller: widget.controller,
              focusNode: widget.focusNode,
              hint: widget.hint,
            ),
          ),
        ),
        SizedBox(height: widget.field.errorText != null ? 5 : 0),
        widget.field.errorText != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  widget.field.errorText!,
                  style: ref.textTheme.body4.copyWith(color: ref.colorTokens.inputs?.stroke?.destructive),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
