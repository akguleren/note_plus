import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:note_plus/app/extension/ref_extension.dart';
import 'package:note_plus/feature/home/viewmodel/home_view_model.dart';
import 'package:note_plus/feature/note/viewmodel/note_view_model.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(HomeNotifier.vm.notifier);
    final notesState = ref.watch(NoteNotifier.note);
    return Scaffold(
      backgroundColor: ref.colorTokens.background?.primary,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ref.commonColors.brand?.main,
        shape: RoundedRectangleBorder(borderRadius: ref.borderRadius12),
        onPressed: vm.navigateNewNote,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Note Plus', style: ref.textTheme.headline6.copyWith(color: ref.colorTokens.text?.primary)),
        actions: [
          IconButton(
            onPressed: () => vm.forceSync(),
            icon: Icon(TablerIcons.refresh, color: ref.colorTokens.icon?.dark),
            tooltip: 'Sync Notes',
          ),
          IconButton(
            onPressed: vm.navigateToSettings,
            icon: Icon(TablerIcons.settings, color: ref.colorTokens.icon?.dark),
          ),
        ],
      ),
      body: notesState.maybeWhen(
        data: (notes) {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(NoteNotifier.note.notifier).forceSync();
            },
            child: notes.isEmpty
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(TablerIcons.note_off, size: 64, color: ref.colorTokens.icon?.dark),
                              const SizedBox(height: 16),
                              Text(
                                'No notes yet',
                                style: ref.textTheme.body2.copyWith(color: ref.colorTokens.text?.secondary),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tap the + button to create your first note',
                                style: ref.textTheme.body3.copyWith(color: ref.colorTokens.text?.secondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: ref.padding12,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return GestureDetector(
                        onTap: () => vm.navigateEditNote(note),
                        child: Container(
                          margin: ref.bottomPadding12,
                          padding: ref.padding12,
                          decoration: BoxDecoration(
                            color: ref.colorTokens.surface?.primary,
                            borderRadius: ref.borderRadius12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(note.title, style: ref.textTheme.body4)),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    visualDensity: VisualDensity.compact,
                                    icon: Icon(TablerIcons.trash, color: ref.colorTokens.icon?.dark, size: 20),
                                    tooltip: 'Delete',
                                    onPressed: () async {
                                      // confirm deletion
                                      final confirmed = await showDialog<bool>(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text('Delete Note'),
                                          content: const Text('Are you sure you want to delete this note?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.of(ctx).pop(false),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.of(ctx).pop(true),
                                              child: const Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      );
                                      if (confirmed == true) {
                                        await ref.read(NoteNotifier.note.notifier).deleteNoteByModel(note);
                                      }
                                    },
                                  ),
                                ],
                              ),
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxHeight: 100),
                                child: Html(data: note.content),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(TablerIcons.exclamation_circle, size: 64, color: ref.colorTokens.icon?.dark),
              const SizedBox(height: 16),
              Text('Failed to load notes', style: ref.textTheme.body2.copyWith(color: ref.colorTokens.text?.primary)),
              const SizedBox(height: 8),
              TextButton(onPressed: () => ref.invalidate(NoteNotifier.note), child: const Text('Retry')),
            ],
          ),
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
