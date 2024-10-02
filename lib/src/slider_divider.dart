import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/src/helper/utils.dart';

import 'slider_direction.dart';

class SliderDivider extends StatelessWidget {
  const SliderDivider({
    Key? key,
    required AnimationController? animationDrawerController,
    required this.animation,
    required this.slideDirection,
    required this.sliderOpenSize,
    required this.divider,
    required this.width,
  })  : _animationDrawerController = animationDrawerController,
        super(key: key);

  final AnimationController? _animationDrawerController;
  final Animation animation;
  final SlideDirection slideDirection;
  final double sliderOpenSize;
  final Color divider;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationDrawerController!,
      builder: (_, child) {
        return Transform.translate(
          offset:
              Utils.getOffsetValuesForDivider(slideDirection, animation.value),
          child: child,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: -1,
            child: Container(
              color: divider,
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}
