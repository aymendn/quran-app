import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useShowSystemOverlays() {
  useEffect(() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffF1E1BA),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffF1E1BA),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    };
  }, []);
}
