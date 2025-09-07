import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/app/constant/hive_key.dart';
import '/app/extension/ref_extension.dart';

import '/app/enums/locale_enum.dart';
import '/main.dart';

@RoutePage(name: 'LanguageBottomSheetRoute')
class LanguageBottomSheet extends ConsumerStatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  ConsumerState<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends ConsumerState<LanguageBottomSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final availableLanguages = LocaleEnum.values;

    return Container(
      decoration: BoxDecoration(
        color: ref.colorTokens.background?.basMenuBg,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      padding: ref.paddingVertical12,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: Text(tr('Settings.Select_Language'), textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28, bottom: 28),
            child: StatefulBuilder(
              builder: (context, setState) {
                return isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        decoration: BoxDecoration(
                          color: ref.colorTokens.surface?.primary,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: availableLanguages.length,
                          separatorBuilder: (context, index) => const Divider(thickness: 1, height: 1),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () async {
                              try {
                                if (context.mounted) {
                                  await context.setLocale(availableLanguages[index].code);
                                }
                                await HiveKey.language.save(availableLanguages[index].name);
                              } catch (e) {
                                rethrow;
                              }
                              appRouter.maybePop();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 50,
                              child: Text(LocaleEnum.values[index].name.toUpperCase(), textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void changeLoading(Function(void Function()) setState) {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
