import 'package:flutter/material.dart';

class ProfilePortrait extends StatefulWidget {
  final String image;

  const ProfilePortrait({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ProfilePortrait> createState() => _ProfilePortraitState();
}

class _ProfilePortraitState extends State<ProfilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          _CircleImage(image: widget.image, width: 200),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              // TODO: Handle camera
              onPressed: () => debugPrint('Camera pressed'),
              icon: const Icon(Icons.camera)
            )
          )
        ],
      ),
    ]);
  }
}

class ProfileText extends StatelessWidget {
  final String name, accountType, flag;
  const ProfileText({
    Key? key,
    required this.name,
    required this.accountType,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TODO: Change default flag by location
        const Positioned.fill(
          child: Opacity(
            opacity: 0.46,
            child: Text(
            '🇲🇽',
            maxLines: 1,
            textScaleFactor: 2.0,
            textAlign: TextAlign.center
          ),
          ),
        ),
        Column(
          children: [
            Text(
              name,
              maxLines: 1,
              textAlign: TextAlign.center,
              textScaleFactor: 1.33,
            ),
            Text(
              accountType,
              maxLines: 1,
              textAlign: TextAlign.center,
              textScaleFactor: 0.8,
            )
          ],
        )
      ],
    );
  }
}

class _CircleImage extends StatelessWidget {
  final String image;
  final double width;
  const _CircleImage({Key? key, required this.image, this.width = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
