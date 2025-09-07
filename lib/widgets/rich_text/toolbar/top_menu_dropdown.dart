import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/widgets/rich_text/toolbar/rich_text_toolbar.dart';
import '/app/extension/ref_extension.dart';

class TopMenuDropdown extends StatefulWidget {
  const TopMenuDropdown({required this.items, required this.onChanged, super.key});
  final List<String> items;
  final void Function(String) onChanged;

  @override
  State<TopMenuDropdown> createState() => _TopMenuDropdownState();
}

class _TopMenuDropdownState extends State<TopMenuDropdown> {
  String? selectedValue;
  final GlobalKey dropdownKey = GlobalKey();
  OverlayEntry? overlayEntry;
  bool? isOpen = false;

  void toggleDropdown() {
    if (overlayEntry == null) {
      openDropdown();
    } else {
      closeDropdown();
    }
  }

  void openDropdown() {
    final renderBox = dropdownKey.currentContext!.findRenderObject()! as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy - (widget.items.length * 50), // Position above
        width: size.width,
        child: Material(
          elevation: 4,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: widget.items
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      widget.onChanged(item);
                      setState(() {
                        selectedValue = item;
                      });
                      closeDropdown();
                    },
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          color: selectedValue == item
                              ? ref.colorTokens.background?.primary
                              : ref.colorTokens.background?.basMenuBg,
                          child: Text(
                            tr(item.toFontSizeText!),
                            style: ref.textTheme.body3.copyWith(color: ref.colorTokens.text?.primary),
                          ),
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
    setState(() {
      isOpen = true;
    });
    Overlay.of(context).insert(overlayEntry!);
  }

  void closeDropdown() {
    removeOverlay();
    setState(() {
      isOpen = false;
    });
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: dropdownKey,
      onTap: toggleDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Consumer(
          builder: (context, ref, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedValue != null ? tr(selectedValue!.toFontSizeText!) : tr('General.Font_Size'),
                  style: ref.textTheme.body3.copyWith(color: ref.colorTokens.text?.secondary),
                ),
                if (isOpen == true)
                  Icon(Icons.arrow_drop_up, color: ref.colorTokens.inputs?.icons?.stable)
                else
                  Icon(Icons.arrow_drop_down, color: ref.colorTokens.inputs?.icons?.stable),
              ],
            );
          },
        ),
      ),
    );
  }
}
