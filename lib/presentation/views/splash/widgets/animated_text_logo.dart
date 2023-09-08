
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class AnimatedLogoText extends StatelessWidget {
  const AnimatedLogoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: const Duration(milliseconds: 200),
      animatedTexts: [
        ScaleAnimatedText('amwaley'.tr(),
          textStyle:TextStyle(fontSize: 32,shadows:[BoxShadow(color: Colors.black.withOpacity(0.25),blurRadius: 4,offset: const Offset(0, 4))],
              color: AppColors.kLogoTextColor,
              fontWeight: FontWeight.w800),),
      ],
    );
  }
}
