import 'package:flutter/material.dart';
import 'package:things_todo/core/widgets/app_loading_widget.dart';

Future<void> showAppLoadingDialog(BuildContext context)async{
  await showDialog(
                      context: context,
                      builder: (context) => AppLoadingWidget.light(),
                      barrierDismissible: false,
                    );
}