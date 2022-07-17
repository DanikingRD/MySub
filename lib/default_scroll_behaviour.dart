// All Rights Reserved (ARR)
// Copyright (c) 2022 NotSuitable Group LTD
// Created by DanikingRD https://github.com/DanikingRD

import 'package:flutter/material.dart';
import 'package:mysub/mysub.dart';

/// Default scroll behaviour for [MySubApp] scrollable widgets
/// It defaults to no glowing scrolling color at all.
class DefaultScrollBehaviour extends MaterialScrollBehavior {

  const DefaultScrollBehaviour();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
