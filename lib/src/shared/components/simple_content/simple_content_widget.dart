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
    if (this.head != null) {
      return this.head ?? Container();
    }
    return Container();
  }

  Widget _buildBody() {
    if (this.expand) {
      return Expanded(child: this.child ?? Container());
    }

    return this.child ?? Container();
  }

  Widget _buildBottom() {
    if (this.bottom != null) {
      return this.bottom ?? Container();
    }
    return Container();
  }
}
