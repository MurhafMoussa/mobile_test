import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/presentation/controllers/register_controller.dart';
import 'package:things_todo/core/resources/app_validation_functions.dart';
import 'package:things_todo/core/resources/constant_values.dart';
import 'package:things_todo/core/widgets/app_text_form_field.dart';
import 'package:things_todo/generated/l10n.dart';

class PhoneFormField extends StatefulWidget {
  const PhoneFormField({
    super.key,
    required this.countryCodeController,
    required this.phoneController,
  });
  final TextEditingController countryCodeController;
  final TextEditingController phoneController;

  @override
  State<PhoneFormField> createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends State<PhoneFormField> {
  CountryCode? countryCode;

  @override
  Widget build(BuildContext context) => AppTextFormField(
        hintText: AppLocalizations.of(context).phoneNumber,
        textEditingController: widget.phoneController,
        textInputType: TextInputType.number,
        textInputAction: TextInputAction.next,
        prefixIcon: GestureDetector(
          onTap: () async {
            countryCode =
                await const FlCountryCodePicker().showPicker(context: context);
            if (countryCode != null) {
              widget.countryCodeController.text = countryCode!.dialCode;
              setState(
                () {},
              );
            }
          },
          child: SizedBox(
            child: countryCode != null
                ? countryCode?.flagImage.paddingSymmetric(horizontal: 10)
                : const Icon(Icons.flag),
          ),
        ),
        validator: (String? name) => AppValidation.validatePhoneNumber(
          name,
          context,
        ),
      ).paddingOnly(
        bottom: paddingBetweenTextFieldsValue,
      );
}
