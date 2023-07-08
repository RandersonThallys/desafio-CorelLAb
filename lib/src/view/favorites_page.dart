import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming soon...',
        style: AppTypography().textTitleAndPrice,
      ),
    );
  }
}
