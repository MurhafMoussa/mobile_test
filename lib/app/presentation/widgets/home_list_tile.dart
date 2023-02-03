import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/font_manager.dart';

class HomeListTile extends StatelessWidget {
  factory HomeListTile.userInfo({
    required String title,
    required IconData icon,
  }) =>
      HomeListTile._(
        _HomeListTileType.userInfo,
        icon: icon,
        title: title,
      );
  factory HomeListTile.option({
    required String title,
    required VoidCallback onTap,
  }) =>
      HomeListTile._(
        _HomeListTileType.option,
        title: title,
        onTap: onTap,
      );
  const HomeListTile._(
    this._listTileType, {
    required this.title,
    this.icon = Icons.arrow_forward_ios,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final _HomeListTileType _listTileType;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    switch (_listTileType) {
      case _HomeListTileType.userInfo:
        return ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(
              color: ColorManager.gray,
              fontSize: FontSizesManager.s16,
            ),
          ),
        );
      case _HomeListTileType.option:
        return Card(
          child: ListTile(
            title: Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: FontSizesManager.s20,
              ),
            ),
            trailing: Icon(
              icon,
            ),
            onTap: onTap,
          ),
        );
    }
  }
}

enum _HomeListTileType { userInfo, option }
