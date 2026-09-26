import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'loading_animation_model.dart';
export 'loading_animation_model.dart';

class LoadingAnimationWidget extends StatefulWidget {
  const LoadingAnimationWidget({
    super.key,
    this.size = 36.0,
    this.strokeWidth = 3.0,
  });

  /// Diameter of the spinner.
  ///
  /// This widget used to render a 200x200 animated WebP that ignored the space
  /// it was put in, so inside a 150-tall placeholder it was clipped and looked
  /// broken. A spinner that fits where it is placed is the point of the swap;
  /// a caller that wants it larger can say so.
  final double size;

  /// Thickness of the spinner's arc.
  final double strokeWidth;

  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {
  late LoadingAnimationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingAnimationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CircularProgressIndicator(
          strokeWidth: widget.strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(
            FlutterFlowTheme.of(context).primary,
          ),
        ),
      ),
    );
  }
}
