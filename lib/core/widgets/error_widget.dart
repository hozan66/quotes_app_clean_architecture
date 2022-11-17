// Packages
import 'package:flutter/material.dart';

// Config
import '../../config/locale/app_localizations.dart';

// Core
import '../utils/app_colors.dart';
import '../utils/app_media_query.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;

  const ErrorWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primary,
            size: 150.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            AppLocalizations.of(context)!.translate('something_went_wrong')!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.translate('try_again')!,
          style: const TextStyle(
            color: AppColors.hint,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          height: 55.0,
          width: context.screenWidth * 0.55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: AppColors.primary,
              elevation: 500.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.translate('reload_screen')!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        ),
      ],
    );
  }
}
