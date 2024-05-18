import 'package:fiber/config/constant.dart';
import 'package:fiber/config/utils/const_class.dart';
import 'package:flutter/material.dart';

const double _kPanelHeaderCollapsedHeight = 48.0;
const double _kPanelHeaderExpandedHeight = 64.0;

class CustomExpansionPanelList extends StatefulWidget {
  const CustomExpansionPanelList(
      {Key? key,
      this.children: const <ExpansionPanel>[],
      required this.expansionCallback,
      this.animationDuration: kThemeAnimationDuration})
      : assert(children != null),
        assert(animationDuration != null),
        super(key: key);

  final List<ExpansionPanel> children;

  final ExpansionPanelCallback expansionCallback;

  final Duration animationDuration;

  @override
  State<CustomExpansionPanelList> createState() =>
      _CustomExpansionPanelListState();
}

class _CustomExpansionPanelListState extends State<CustomExpansionPanelList> {
  bool _isChildExpanded(int index) {
    return widget.children[index].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[];
    const EdgeInsets kExpandedEdgeInsets = const EdgeInsets.symmetric(
        vertical: _kPanelHeaderExpandedHeight - _kPanelHeaderCollapsedHeight);

    for (int index = 0; index < widget.children.length; index += 1) {
      if (_isChildExpanded(index) && index != 0 && !_isChildExpanded(index - 1))
        items.add(new Divider(
          key: new _SaltedKey<BuildContext, int>(context, index * 2 - 1),
          height: 0.0,
          color: Colors.transparent,
        ));

      final header = Row(
        children: <Widget>[
          new Expanded(
            child: new AnimatedContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.medium, vertical: Insets.exSmall),
              duration: widget.animationDuration,
              curve: Curves.fastOutSlowIn,
              // margin: _isChildExpanded(index)
              //     ? kExpandedEdgeInsets
              //     : EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.all(Insets.exSmall),
                height: _kPanelHeaderCollapsedHeight,
                child: widget.children[index].headerBuilder(
                  context,
                  widget.children[index].isExpanded,
                ),
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsetsDirectional.only(end: 10.0),
            child: new ExpandIcon(
              isExpanded: _isChildExpanded(index),
              onPressed: (bool isExpanded) {
                if (widget.expansionCallback != null)
                  widget.expansionCallback(index, isExpanded);
              },
            ),
          ),
        ],
      );

      items.add(
        new Container(
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.large),
              border: Border.all(width: 1, color: Colors.white)),
          key: new _SaltedKey<BuildContext, int>(context, index * 2),
          child: new Material(
            borderRadius: BorderRadius.circular(Insets.large),
            elevation: 0.0,
            color: Colors.white.withOpacity(0.6),
            borderOnForeground: true,
            child: new Column(
              children: <Widget>[
                header,
                new AnimatedCrossFade(
                  firstChild: new Container(height: 0.0),
                  secondChild: widget.children[index].body,
                  firstCurve:
                      const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                  secondCurve:
                      const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                  sizeCurve: Curves.fastOutSlowIn,
                  crossFadeState: _isChildExpanded(index)
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: widget.animationDuration,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return new Column(
      children: items,
    );
  }
}

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt && value == typedOther.value;
  }

  @override
  int get hashCode => hashValues(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}
