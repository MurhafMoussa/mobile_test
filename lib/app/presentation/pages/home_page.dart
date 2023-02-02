import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/app/presentation/controllers/home_controller.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';
import 'package:things_todo/generated/l10n.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).homepage),
        ),
        body: ListView(
          padding: appHorizontalPadding.copyWith(top: 10),
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("morhaf"),
            ),
          ],
        ));
  }
}
