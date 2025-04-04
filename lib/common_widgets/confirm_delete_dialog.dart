import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quran_app/common_widgets/custom_button.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/i18n/strings.g.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmDeleteDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              context.t.confirmDelete,
            ),
          ),
          IconButton(
            onPressed: context.pop,
            visualDensity: VisualDensity.compact,
            icon: Icon(Symbols.close),
          ),
        ],
      ),
      content: Text(
        context.t.confirmDeleteMessage,
      ),
      actions: [
        CustomButton(
          onPressed: context.pop,
          text: context.t.cancel,
          backgroundColor: context.colors.white,
          foregroundColor: context.colors.grey800,
          strokeColor: context.colors.grey300,
        ),
        CustomButton(
          onPressed: () {
            onConfirm();
            context.pop();
          },
          text: context.t.confirmDelete,
          backgroundColor: context.colors.error,
        ),
      ],
    );
  }
}
