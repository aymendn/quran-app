import 'package:flutter/material.dart';
import 'package:quran_app/extensions/context_extensions.dart';
import 'package:quran_app/extensions/screen_utils_extensions.dart';
import 'package:quran_app/features/onboarding/domain/riwayah_model.dart';

class RiwayahSelect extends StatelessWidget {
  final RiwayahModel riwayah;
  final bool isSelected;
  final VoidCallback onSelected;

  const RiwayahSelect({
    super.key,
    required this.riwayah,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: isSelected
              ? context.colors.primary.withOpacity(.4)
              : context.colors.stroke,
        ),
      ),
      selected: isSelected,
      selectedTileColor: context.colors.primary.withOpacity(0.1),
      selectedColor: context.colors.primary,
      leading: Icon(
        isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
        color: isSelected ? context.colors.primary : Colors.grey,
        size: 24.rm,
      ),
      onTap: onSelected,
      title: Text(riwayah.name.displayText(context)),
      subtitle: Text(riwayah.qualityDisplayText(context)),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.download_rounded,
            size: 18.rm,
          ),
          6.gapH,
          Text(riwayah.size.toString() + ' MB'),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
