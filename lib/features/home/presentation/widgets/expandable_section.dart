import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  const ExpandableSection({
    super.key,
    required this.expand,
    required this.child,
    this.curve = Curves.easeOutCirc,
  });
  final Widget child;
  final bool expand;
  final Curve curve;

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void _prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: expandController,
      reverseCurve: widget.curve,
      curve: widget.curve,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandableSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: -4,
      sizeFactor: animation,
      child: widget.child,
    );
  }
}
