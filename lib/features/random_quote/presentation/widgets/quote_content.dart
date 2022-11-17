// Packages
import 'package:flutter/material.dart';

// Core
import '../../../../core/utils/app_colors.dart';

// Entities
import '../../domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;

  const QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Text(
            quote.content,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              quote.author,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
