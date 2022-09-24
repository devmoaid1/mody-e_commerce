import 'package:flutter/material.dart';
import 'package:mody_ecommerce/Ui/screens/splash/splash_viewModel.dart';
import 'package:mody_ecommerce/Ui/utilities/screen_sizes.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, _) => Center(
          child: SizedBox(
            width: screenWidthPercentage(context, percentage: 0.6),
            child: const Image(
              fit: BoxFit.fill,
              image: AssetImage(Assets.modyIcon),
            ),
          ),
        ),
      ),
    );
  }
}
