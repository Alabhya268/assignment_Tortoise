import 'package:assignment/widget/flexi_card_widget.dart';
import 'package:flutter/material.dart';

class FlexiList extends StatelessWidget {
  const FlexiList({
    super.key,
    required this.cardData,
  });

  final List<Map<String, dynamic>> cardData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = cardData[index];
        return FlexiCardWidget(data: data);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemCount: cardData.length,
    );
  }
}
