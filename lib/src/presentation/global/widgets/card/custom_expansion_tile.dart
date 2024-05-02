import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.onExpansionChanged,
    required this.child,
    this.trailing,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.elevation = 2.0,
    this.initialElevation = 0.0,
    this.initiallyExpanded = false,
    this.initialPadding = EdgeInsets.zero,
    this.finalPadding = const EdgeInsets.only(bottom: 6.0),
    this.contentPadding,
    this.baseColor,
    this.expandedColor,
    required this.titleBackgroundColor,
    this.expandedTextColor,
    this.duration = const Duration(milliseconds: 400),
    this.elevationCurve = Curves.easeOut,
    this.heightFactorCurve = Curves.easeIn,
    this.turnsCurve = Curves.easeIn,
    this.colorCurve = Curves.easeIn,
    this.paddingCurve = Curves.easeIn,
    this.isThreeLine = false,
    this.shadowColor = const Color(0xffaaaaaa),
    required this.sideColor,
    this.animateTrailing = false,
  }) : super(key: key);

  final bool isThreeLine;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final ValueChanged<bool>? onExpansionChanged;
  final Widget child;
  final Widget? trailing;
  final bool animateTrailing;
  final BorderRadiusGeometry borderRadius;
  final Color sideColor;
  final Color titleBackgroundColor;
  final double elevation;
  final double initialElevation;
  final Color shadowColor;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry initialPadding;
  final EdgeInsetsGeometry finalPadding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? baseColor;
  final Color? expandedColor;
  final Color? expandedTextColor;
  final Duration duration;
  final Curve elevationCurve;
  final Curve heightFactorCurve;
  final Curve turnsCurve;
  final Curve colorCurve;
  final Curve paddingCurve;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<double> _elevation;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _materialColor;
  late Animation<EdgeInsets> _padding;
  late Animation<double> _iconTurns;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _heightFactor =
        _controller.drive(CurveTween(curve: widget.heightFactorCurve));
    _headerColor = _controller
        .drive(ColorTween(begin: Colors.transparent, end: Colors.transparent));
    _iconColor = _controller
        .drive(ColorTween(begin: Colors.transparent, end: Colors.transparent));
    _materialColor = _controller
        .drive(ColorTween(begin: Colors.transparent, end: Colors.transparent));
    _elevation = _controller.drive(
        Tween<double>(begin: widget.initialElevation, end: widget.elevation));
    _padding = _controller.drive(
      EdgeInsetsTween(
          begin: widget.initialPadding as EdgeInsets?,
          end: widget.finalPadding as EdgeInsets?),
    );
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(
        CurvedAnimation(parent: _controller, curve: widget.turnsCurve));
    _isExpanded = widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setExpansion(bool shouldBeExpanded) {
    if (shouldBeExpanded != _isExpanded) {
      setState(() {
        _isExpanded = shouldBeExpanded;
        if (_isExpanded) {
          _controller.forward();
        } else {
          _controller.reverse().then<void>((void value) {
            if (!mounted) return;
            setState(() {});
          });
        }
        widget.onExpansionChanged?.call(_isExpanded);
      });
    }
  }

  void expand() {
    _setExpansion(true);
  }

  void collapse() {
    _setExpansion(false);
  }

  void toggleExpansion() {
    _setExpansion(!_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Padding(
      padding: _padding.value,
      child: Material(
        type: MaterialType.card,
        color: _materialColor.value,
        borderRadius: widget.borderRadius,
        elevation: _elevation.value,
        shadowColor: widget.shadowColor,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: widget.sideColor,
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                customBorder:
                    RoundedRectangleBorder(borderRadius: widget.borderRadius),
                onTap: toggleExpansion,
                child: ListTileTheme.merge(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  child: Material(
                    color: widget.titleBackgroundColor,
                    child: ListTile(
                      isThreeLine: widget.isThreeLine,
                      contentPadding: widget.contentPadding,
                      leading: widget.leading,
                      title: widget.title,
                      subtitle: widget.subtitle,
                      trailing: RotationTransition(
                        turns: _iconTurns,
                        child: widget.trailing ??
                            const Icon(
                              Icons.expand_more,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : SizedBox(child: widget.child),
    );
  }
}
