// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:ion/app/extensions/extensions.dart';
import 'package:ion/app/features/auth/views/components/user_data_inputs/general_user_data_input.dart';
import 'package:ion/app/utils/validators.dart';
import 'package:ion/generated/assets.gen.dart';

class NameInput extends StatelessWidget {
  const NameInput({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GeneralUserDataInput(
      controller: controller,
      prefixIconAssetName: Assets.svg.iconFieldName,
      labelText: context.i18n.fill_profile_input_name,
      validator: (String? value) {
        if (Validators.isEmpty(value)) return '';
        return null;
      },
    );
  }
}