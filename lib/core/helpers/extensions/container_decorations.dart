import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

extension ContainerBoxDecoration on BoxDecoration {
  BoxDecoration card(BuildContext context) {
    return BoxDecoration(
      color: context.appColors.surfacesWhite,
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          spreadRadius: 1,
          blurRadius: 6,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  BoxDecoration itemSelected(BuildContext context, bool isSelected) {
    return BoxDecoration(
      color: context.appColors.surfacesWhite,
      border: Border.all(
        color: isSelected
            ? context.appColors.primaryColor
            : context.appColors.surfacesWhite,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      boxShadow: [
        if (!isSelected)
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
      ],
    );
  }
}
