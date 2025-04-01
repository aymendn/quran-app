import 'package:flutter/material.dart';

class ScrollableColumn extends StatelessWidget {
  const ScrollableColumn({
    super.key,
    this.padding,
    this.formKey,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.constraintMinHeight = false,
    this.scrollController,
  });

  final EdgeInsets? padding;
  final List<Widget> children;
  final GlobalKey<FormState>? formKey;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool constraintMinHeight;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = (padding?.top ?? 0) + (padding?.bottom ?? 0);

    final column = Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );

    Widget widget = SafeArea(
      child: constraintMinHeight
          ? LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  padding: padding,
                  controller: scrollController,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraint.maxHeight - horizontalPadding - .01,
                    ),
                    child: IntrinsicHeight(child: column),
                  ),
                );
              },
            )
          : SingleChildScrollView(
              padding: padding,
              child: column,
            ),
    );

    if (formKey != null) {
      widget = Form(key: formKey, child: widget);
    }

    return widget;
  }
}
