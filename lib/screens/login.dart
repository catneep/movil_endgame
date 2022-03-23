import 'package:flutter/material.dart';

import '../widgets/elements/modal.dart';
import '../widgets/elements/titles.dart';

const APP_TITLE = "Guglu";
const LOGO_URL = "https://bulma.io/images/bulma-logo.png";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: const [VideoBackground(), LoginForeground()],
      ),
    );
  }
}

class LoginForeground extends StatelessWidget {
  const LoginForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const TitleText(title: APP_TITLE),
          Image(image: Image.network(LOGO_URL).image),
          ElevatedButton(
              onPressed: () =>
                  openModal(context, operation: "register", title: "Registro"),
              child: const Text("Registro")),
          ElevatedButton(
              onPressed: () =>
                  openModal(context, operation: "login", title: "Login"),
              child: const Text("Inicar Sesión")),
          ElevatedButton(
              onPressed: () => startDemo(), child: const Text("Demo")),
        ],
      ),
    );
  }
}

class VideoBackground extends StatefulWidget {
  const VideoBackground({Key? key}) : super(key: key);

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text("TODO render background video"),
        color: Colors.amber,
      ),
    );
  }
}

void startDemo() {
  debugPrint("Starting app in demo mode");
}
