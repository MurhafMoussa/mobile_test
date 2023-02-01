import 'package:flutter/material.dart';
import 'package:things_todo/core/widgets/constant_global_widgets.dart';

OutlineInputBorder customOutlineInputBorder(Color color) => OutlineInputBorder(
      borderRadius: appLargeBorderRaduis,
      borderSide: BorderSide(
        color: color,
      ),
    );
