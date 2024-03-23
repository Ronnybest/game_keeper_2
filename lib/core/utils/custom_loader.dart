import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GlobalCustomLoader extends StatelessWidget {
  const GlobalCustomLoader({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black26,
      overlayWidgetBuilder: (progress) {
        return Center(
          child: Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(214, 0, 0, 0),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 30.sp,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
