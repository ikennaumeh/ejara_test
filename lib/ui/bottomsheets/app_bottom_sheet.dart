import 'package:ejara_test/navigation/navigator_key.dart';
import 'package:ejara_test/ui/bottomsheets/app_bottom_sheet_vm.dart';
import 'package:ejara_test/ui/bottomsheets/widgets/custom_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin AppBottomSheet {
  Future<bool?> showAppBottomSheet(int? id) async {
    final context = NavigatorKey.appNavigatorKey.currentContext;

    return await showModalBottomSheet(
      context: context!,
      backgroundColor: const Color(0xfff9f9fb),
      isScrollControlled: false,
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.63),
      shape:
          const OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (context) {
        return ChangeNotifierProvider<AppBottomSheetVM>(
          create: (_) => AppBottomSheetVM(id),
          builder: (_, __) {
            return const CustomModal();
          }
        );
      },
    );
  }
}

