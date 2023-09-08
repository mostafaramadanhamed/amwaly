
import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(

      AppAssets.kLogo,width: double.infinity,
    );
  }
}
