part of 'custom_bottom_bar.dart';

class BuildIcon extends StatelessWidget {
  final TabItem item;
  final double iconSize;
  final Color iconColor;
  final CountStyle? countStyle;

  const BuildIcon({
    super.key,
    required this.item,
    required this.iconColor,
    this.iconSize = 22,
    this.countStyle,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon = (item.icon is Widget)
        ? item.icon
        : Icon(
            item.icon,
            size: iconSize,
            color: iconColor,
          );
    if (item.count is Widget) {
      double sizeBadge = countStyle?.size ?? 18;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            item.icon,
            size: iconSize,
            color: iconColor,
          ),
          PositionedDirectional(
            start: iconSize - sizeBadge / 2,
            top: -sizeBadge / 2,
            child: item.count!,
          ),
        ],
      );
    }
    return icon;
  }
}

class TabItem<T> {
  final T icon;
  final String? title;
  final Widget? count;
  final String? key;

  const TabItem({
    required this.icon,
    this.title,
    this.count,
    this.key,
  }) : assert(icon is IconData || icon is Widget,
            'TabItem only support IconData and Widget');
}

class CountStyle {
  final double? size;
  final Color? background;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? paddingContent;

  const CountStyle({
    this.size,
    this.background,
    this.color,
    this.textStyle,
    this.paddingContent,
  });
}

class HighlightStyle {
  final bool sizeLarge;
  final Color? background;
  final Color? color;
  final double? elevation;

  const HighlightStyle({
    this.sizeLarge = false,
    this.background,
    this.color,
    this.elevation,
  });
}

bool isShadow = true;
List<BoxShadow> shadow = [
  if (isShadow)
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.06),
      spreadRadius: 0,
      blurRadius: 20,
      offset: Offset(0, 6), // changes position of shadow
    )
  else
    const BoxShadow(color: Colors.transparent)
];

class BuildLayout extends StatelessWidget {
  final Widget? child;
  final BoxDecoration? decoration;
  final double? blur;
  final Clip? clipBehavior;

  const BuildLayout({
    super.key,
    this.child,
    this.decoration,
    this.blur,
    this.clipBehavior,
  });

  @override
  Widget build(BuildContext context) {
    if (blur != null) {
      return Container(
        decoration: decoration,
        clipBehavior: clipBehavior ?? Clip.antiAlias,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur ?? 4, sigmaY: blur ?? 4),
            child: Container(
              decoration: decoration?.copyWith(color: Colors.transparent),
              child: child,
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: decoration,
      clipBehavior: clipBehavior ?? Clip.antiAliasWithSaveLayer,
      child: child,
    );
  }
}
