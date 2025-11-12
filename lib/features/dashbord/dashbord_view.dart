import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/features/dashbord/widgets/dashbord_view_body.dart';

class DashbordView extends StatelessWidget {
  const DashbordView({super.key});
  static const routeName = 'dashbord';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashbordViewBody());
  }
}
