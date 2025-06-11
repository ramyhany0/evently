import 'package:evently/ui/home/widgets/EventItem.dart';
import 'package:flutter/material.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (context, index) => EventItem(),
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: 10,
      ),
    );
  }
}
