import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:things_todo/core/resources/assets_manager.dart';
import 'package:things_todo/core/resources/constants.dart';
import 'package:things_todo/core/widgets/svg_asset_icon.dart';
import 'package:things_todo/features/home/presentation/widgets/app_title.dart';
import 'package:things_todo/features/home/presentation/widgets/daily_tab.dart';
import 'package:things_todo/features/home/presentation/widgets/weekly_tab.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TabController tabBarController = useTabController(
      initialLength: 3,
    );
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: const AppTitle(),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const SvgAssetIcon(
                  path: AssetsManager.alarmIcon,
                  scaleFactor: 1.5,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: const SvgAssetIcon(
                  path: AssetsManager.addIcon,
                  scaleFactor: 1.5,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
            snap: true,
            floating: true,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: appHorizontalPadding,
                  child: AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              controller: tabBarController,
              labelPadding: const EdgeInsets.only(bottom: 5),
              tabs: const <Widget>[
                Tab(
                  text: 'DAILY',
                ),
                Tab(
                  text: 'WEEKLY',
                ),
                Tab(
                  text: 'MONTHLY',
                ),
              ],
            ),
            collapsedHeight: 140,
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabBarController,
              children: const <Widget>[
                DailyTab(),
                WeeklyTab(),
                DailyTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
