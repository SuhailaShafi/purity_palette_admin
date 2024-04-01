import 'package:flutter/material.dart';
import 'package:purity_admin/utils/constants/sizes.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(dark
              ? 'assets/images/logo_light.jpg'
              : 'assets/images/logo_light.jpg'),
          height: 150,
        ),
        Text(
          'Welcome,',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: SSizes.sm,
        ),
        Text(
          'Discover Limitless Choices and fill your palette',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
