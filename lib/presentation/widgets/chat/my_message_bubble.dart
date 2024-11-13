import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app_salazar_kevin/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final timeFormat = DateFormat('HH:mm').format(message.timestamp);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              timeFormat,
              style: TextStyle(fontSize: 12, color: colors.onSurface.withOpacity(0.6)),
            ),
            const SizedBox(width: 5),
            Icon(
              message.isRead ? Icons.done_all : Icons.check,
              size: 18,
              color: message.isRead ? Colors.blue : colors.onSurface.withOpacity(0.6),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
