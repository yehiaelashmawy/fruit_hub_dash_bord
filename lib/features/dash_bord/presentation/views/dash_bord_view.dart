import 'package:flutter/material.dart';

import 'widgets/dash_bord_view_body.dart';

class DashBordView extends StatelessWidget {
  const DashBordView({super.key});
  static const routeName = 'DashBord';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const DashBordViewBody());
  }
}
