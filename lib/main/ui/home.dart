import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/main/ui/components/circle_image.dart';

import '../ui/components/ripple_button.dart';

class Home extends StatefulWidget {
  const Home({
    required this.name,
    required this.onContactClicked,
    Key? key,
  }) : super(key: key);

  final String name;
  final VoidCallback onContactClicked;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0, bottom: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Avatar(),
          const SizedBox(height: 16.0),
          Text(
            widget.name,
            style: Theme.of(context).textTheme.displayLarge,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16.0),
          _PositionLabel(),
          const SizedBox(height: 24.0),
          RippleButton(
            text: 'Contact me',
            onTap: () {
              widget.onContactClicked();
            },
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatefulWidget {
  @override
  State<_Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<_Avatar> {
  @override
  Widget build(BuildContext context) {
    return const _AnimatedGradient(
      child: CircleImage(
        imageAsset: 'assets/img/avatar.jpg',
        radius: 100,
      ),
    );
  }
}

class _AnimatedGradient extends StatefulWidget {
  const _AnimatedGradient({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<_AnimatedGradient> {
  List<Color> colorList = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];

  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;

  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        bottomColor = Colors.blue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(6),
      duration: const Duration(seconds: 1),
      onEnd: () {
        setState(() {
          index = index + 1;
          bottomColor = colorList[index % colorList.length];
          topColor = colorList[(index + 1) % colorList.length];
        });
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: begin, end: end, colors: [bottomColor, topColor]),
        shape: BoxShape.circle,
      ),
      child: widget.child,
    );
  }
}

class _PositionLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<String> positions = [
      'Senior Android developer',
      'Senior Flutter developer'
    ];
    return SizedBox(
      height: 150.0,
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.center,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'I am a ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: positions
                .map(
                  (position) => TypewriterAnimatedText(
                    position,
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    speed: const Duration(milliseconds: 70),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
