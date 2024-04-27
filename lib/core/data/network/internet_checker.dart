import '../../dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';

class InternetChecker extends StatefulWidget {
  final Widget child;
  final Function? onConnect;

  const InternetChecker({
    Key? key,
    required this.child,
    this.onConnect,
  }) : super(key: key);

  @override
  State<InternetChecker> createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  final internet = getIt<InternetConnectionChecker>();
  @override
  void initState() {
    internet.onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.connected &&
          widget.onConnect != null) {
        widget.onConnect!();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      stream: internet.onStatusChange,
      builder: (context, snapshot) {
        if (snapshot.data == InternetConnectionStatus.connected) {
          return widget.child;
        }
        return buildNoInternetWidget();
      },
    );
  }

  Widget buildNoInternetWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: const Text('No internet connection'),
      // child: EmptyViewScreen(item: EmptyItems.connectionEmpty),
    );
  }
}
