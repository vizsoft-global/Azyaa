// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// A row of recent search terms, with per-term delete and a clear-all.
///
/// Shared by the shop page and the creators page so both surfaces present
/// history identically. Renders nothing when [terms] is empty, so callers can
/// place it unconditionally.
class AzyRecentSearchesView extends StatelessWidget {
  const AzyRecentSearchesView({
    super.key,
    required this.terms,
    this.onSelected,
    this.onRemoved,
    this.onCleared,
    this.horizontalPadding = 16.0,
    this.width,
    this.height,
  });

  final List<String> terms;
  final void Function(String term)? onSelected;
  final void Function(String term)? onRemoved;
  final VoidCallback? onCleared;
  final double horizontalPadding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (terms.isEmpty) {
      return const SizedBox.shrink();
    }
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        horizontalPadding,
        0.0,
        horizontalPadding,
        0.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.history, size: 16.0, color: theme.primaryText),
              const SizedBox(width: 6.0),
              Text(
                FFLocalizations.of(context).getVariableText(
                  enText: 'Recent searches',
                  arText: 'عمليات البحث الأخيرة',
                ),
                style: theme.titleSmall.override(
                  fontFamily: 'almarai',
                  color: theme.primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              if (onCleared != null)
                TextButton(
                  onPressed: onCleared,
                  child: Text(
                    FFLocalizations.of(context).getVariableText(
                      enText: 'Clear',
                      arText: 'مسح',
                    ),
                    style: theme.bodySmall.override(
                      fontFamily: 'almarai',
                      color: theme.primary,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (final term in terms)
                InputChip(
                  label: Text(
                    term,
                    style: theme.bodySmall.override(
                      fontFamily: 'almarai',
                      color: theme.primaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                  backgroundColor: theme.secondaryBackground,
                  side: BorderSide(color: theme.border, width: 1.0),
                  onPressed: onSelected == null ? null : () => onSelected!(term),
                  onDeleted: onRemoved == null ? null : () => onRemoved!(term),
                  deleteIcon: Icon(
                    Icons.close,
                    size: 14.0,
                    color: theme.secondaryText,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
