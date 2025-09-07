import 'package:auto_route/auto_route.dart';
import 'package:delta_to_html/delta_to_html.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/parser/html_to_delta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:note_plus/app/extension/ref_extension.dart';
import 'package:note_plus/feature/note/model/note_model.dart';
import 'package:note_plus/feature/note/viewmodel/note_view_model.dart';
import 'package:note_plus/widgets/rich_text/field/rich_text_field.dart';

@RoutePage()
class NoteView extends ConsumerStatefulWidget {
  const NoteView({super.key, this.note});

  final NoteModel? note;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoteViewState();
}

class _NoteViewState extends ConsumerState<NoteView> {
  final formKey = GlobalKey<FormBuilderState>();
  late QuillController textController;
  final focusNod = FocusNode();
  final boxGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    textController = QuillController.basic();

    if (widget.note != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        formKey.currentState
          ?..save()
          ..patchValue({'title': widget.note?.title ?? '', 'content': widget.note?.content ?? ''})
          ..save();
      });
    }
  }

  @override
  void dispose() {
    textController.dispose();
    focusNod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(NoteNotifier.vm.notifier);

    return FormBuilder(
      key: formKey,
      child: Scaffold(
        backgroundColor: ref.colorTokens.surface?.primary,
        appBar: AppBar(
          leadingWidth: 30,
          leading: IconButton(
            splashRadius: 1,
            padding: EdgeInsets.only(left: 8),
            onPressed: () => vm.saveAndExit(formKey, widget.note),
            icon: Icon(TablerIcons.chevron_left, color: ref.colorTokens.icon?.dark),
          ),
          actions: [
            IconButton(
              splashRadius: 1,
              padding: EdgeInsets.only(right: 8),
              onPressed: () => vm.saveAndExit(formKey, widget.note),
              icon: Icon(Icons.save, color: ref.colorTokens.icon?.dark),
            ),
          ],
          title: FormBuilderTextField(
            name: 'title',
            decoration: InputDecoration(
              hint: Text(
                tr('Note.Title_Hint'),
                style: ref.textTheme.body1.copyWith(color: ref.colorTokens.text?.secondary),
              ),
              filled: false,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            style: ref.textTheme.headline7.copyWith(color: ref.colorTokens.text?.primary),
          ),
        ),
        body: FormBuilderField(
          name: 'content',
          valueTransformer: (dynamic value) {
            if (value == null) return null;

            return value is String ? value : DeltaToHTML.encodeJson(value.toDelta().toJson() as List<dynamic>);
          },
          builder: (field) {
            if (field.value != null && field.value is String) {
              final delta = HtmlToDelta().convert(field.value as String);
              textController.document = Document.fromDelta(delta);
            }
            return RichTextField(
              field: field,
              controller: textController,
              focusNode: focusNod,
              boxKey: boxGlobalKey,
              hint: tr('Note.Content_Hint'),
            );
          },
        ),
      ),
    );
  }
}
