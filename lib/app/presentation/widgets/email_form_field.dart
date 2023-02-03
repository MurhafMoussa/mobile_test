import 'package:flutter/material.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/generated/l10n.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.emailController,
  });

  
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) => AppTextFormField(
      hintText: AppLocalizations.of(context).emailAddress,
      textEditingController: emailController,
      textInputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (String? email) => AppValidation.validateEmail(
        email,
        context,
      ),
    );
}