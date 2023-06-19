import 'package:flutter/material.dart';

class SimpleContentContainer extends StatelessWidget {
  final Widget? head;
  final Widget? child;
  final Widget? bottom;
  final bool expand;

  const SimpleContentContainer({
    this.head,
    this.bottom,
    this.child,
    this.expand = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHead(),
        _buildBody(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildHead() {
    if (head != null) {
      return head ?? Container();
    }
    return Container();
  }

  Widget _buildBody() {
    if (expand) {
      return Expanded(child: child ?? Container());
    }

    return child ?? Container();
  }

  Widget _buildBottom() {
    if (bottom != null) {
      return bottom ?? Container();
    }
    return Container();
  }
}
