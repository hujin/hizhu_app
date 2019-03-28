import 'package:flutter/widgets.dart';

class HizhuIcon {
  static const IconData portal = const _HizhuIconData(0xe60b);
  static const IconData find_renter = const _HizhuIconData(0xe609);
  static const IconData notice = const _HizhuIconData(0xe607);
  static const IconData mine = const _HizhuIconData(0xe608);
  static const IconData search = const _HizhuIconData(0xe60a);
  static const IconData location = const _HizhuIconData(0xe604);
}

class _HizhuIconData extends IconData{
  const _HizhuIconData(int codePoint) : super(
    codePoint,
    fontFamily:'HizhuIcon'
  );
}