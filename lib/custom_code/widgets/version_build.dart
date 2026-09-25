// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:package_info_plus/package_info_plus.dart';

class VersionBuild extends StatefulWidget {
  const VersionBuild({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<VersionBuild> createState() => _VersionBuildState();
}

class _VersionBuildState extends State<VersionBuild> {
  String _version = '';
  String _buildNumber = '';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
      _buildNumber = info.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Version: $_version Build $_buildNumber'),
    );
  }
}
