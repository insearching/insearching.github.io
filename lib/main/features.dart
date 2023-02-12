import 'package:flutter/material.dart';
import 'package:portfolio/main/components/elevated_container.dart';
import 'package:portfolio/utils/colors.dart';

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, bottom: 64.0),
      child: Column(
        children: [
          Text('Features'.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32.0),
          Text(
            'What I Do',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 24.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _FeatureContainer(
                  icon: 'assets/img/android.png',
                  title: 'Android development',
                  subtitle: 'Subtitle',
                ),
              ),
              // SizedBox(width: 24.0),
              Expanded(
                child: _FeatureContainer(
                  icon: 'assets/img/flutter.png',
                  title: 'Flutter development',
                  subtitle: 'Subtitle',
                ),
              ),
              // SizedBox(width: 24.0),
              Expanded(
                child: _FeatureContainer(
                  icon: 'assets/img/home.png',
                  title: 'Title',
                  subtitle: 'Subtitle',
                ),
              ),
              SizedBox(width: 24.0),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureContainer extends StatefulWidget {
  const _FeatureContainer({
    required this.icon,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  final String icon;
  final String title;
  final String subtitle;

  @override
  State<_FeatureContainer> createState() => _FeatureContainerState();
}

class _FeatureContainerState extends State<_FeatureContainer> {
  bool _isArrowVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedContainer(
        onElevatedChanged: (value) {
          setState(() {
            _isArrowVisible = value;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.icon,
                color: UIColors.accent,
                width: 50.0,
                height: 50.0,
              ),
              const SizedBox(height: 32.0),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24.0),
              Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Opacity(
                opacity: _isArrowVisible ? 1.0 : 0.0,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0),
                    Icon(
                      Icons.arrow_forward,
                      size: 40.0,
                      color: UIColors.accent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
