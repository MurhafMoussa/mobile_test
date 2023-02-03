
import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/generated/l10n.dart';

class FullNameFormField extends StatelessWidget {
  const FullNameFormField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) => AppTextFormField(
      hintText: AppLocalizations.of(context).fullName,
      textEditingController: nameController,
      textInputAction: TextInputAction.next,
      validator: (String? name) => AppValidation.validateName(
        name,
        context,
      ),
    );
}
