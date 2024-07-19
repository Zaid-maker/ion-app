import 'package:flutter/material.dart';
import 'package:ice/app/components/card/rounded_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'regular',
  type: RoundedCard,
)
Widget regularRoundedCardUseCase(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedCard(
          child: Text('Simple Rounded Card'),
        ),
      ],
    ),
  );
}