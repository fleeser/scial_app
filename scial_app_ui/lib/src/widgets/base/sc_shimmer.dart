import 'package:flutter/material.dart';
import 'package:scial_app_ui/src/theme/sc_theme.dart';
import 'package:scial_app_ui/src/theme/sc_theme_data.dart';

class SCShimmer extends StatefulWidget {

  const SCShimmer({
    super.key,
    this.child
  });

  final Widget? child;

  static SCShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<SCShimmerState>();
  }

  @override
  SCShimmerState createState() => SCShimmerState();
}

class SCShimmerState extends State<SCShimmer> with SingleTickerProviderStateMixin {

  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();

    super.dispose();
  }

  Listenable get shimmerChanges => _shimmerController;

  LinearGradient get gradient => LinearGradient(
    colors: shimmerGradient(context).colors,
    stops: shimmerGradient(context).stops,
    begin: shimmerGradient(context).begin,
    end: shimmerGradient(context).end,
    transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
  );

  bool get isSized => (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({ required RenderBox descendant, Offset offset = Offset.zero }) {
    final shimmerBox = context.findRenderObject() as RenderBox;

    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

LinearGradient shimmerGradient(BuildContext context) {
  SCThemeData theme = SCTheme.of(context);

  return LinearGradient(
    colors: [
      theme.colors.shimmerBackground,
      theme.colors.shimmerLine,
      theme.colors.shimmerBackground
    ],
    stops: const [
      0.1,
      0.3,
      0.4,
    ],
    begin: const Alignment(-1.0, -0.3),
    end: const Alignment(1.0, 0.3),
    tileMode: TileMode.clamp
  );
}

class SCShimmerLoading extends StatefulWidget {
  
  const SCShimmerLoading({
    super.key,
    required this.isLoading,
    required this.loadingChild,
    required this.child
  });

  final bool isLoading;
  final Widget loadingChild;
  final Widget child;

  @override
  State<SCShimmerLoading> createState() => _SCShimmerLoadingState();
}

class _SCShimmerLoadingState extends State<SCShimmerLoading> {

  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = SCShimmer.of(context)?.shimmerChanges;
    
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // TODO: Update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final shimmer = SCShimmer.of(context)!;

    if (!shimmer.isSized) {
      return const SizedBox();
    }

    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(descendant: context.findRenderObject() as RenderBox);

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          )
        );
      },
      child: widget.loadingChild
    );
  }
}

class SCShimmerLoadingBox extends StatelessWidget {

  const SCShimmerLoadingBox({
    super.key,
    required this.size,
    this.borderRadius
  });

  final Size size;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? size.height / 2.0),
        color: Colors.black
      )
    );
  }
}