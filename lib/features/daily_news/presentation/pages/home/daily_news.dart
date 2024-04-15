import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text("Daily News", style: TextStyle(color: Colors.black)),
    );
  }
}
