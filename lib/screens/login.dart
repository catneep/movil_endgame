import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../widgets/elements/modal.dart';
import '../widgets/elements/titles.dart';

const APP_TITLE = "Guglu Alpha Beta 0.2 :( (Game of the Year Edition)";
const LOGO_URL = "https://bulma.io/images/bulma-logo.png";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [VideoBackground(), LoginForeground()],
    );
  }
}

class LoginForeground extends StatelessWidget {
  const LoginForeground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TitleText(title: APP_TITLE),
          Image(
              height: 230,
              width: 230,
              image: Image.asset('assets/applogo.png').image),
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
          const SizedBox(height: 80)
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
  // Asset desde pubsec.yaml
  final videoController = VideoPlayerController.asset('assets/portrait.mp4');
  late ChewieController chewieController;

  @override
  initState() {
    super.initState();
    // Se tendría que dar un await a initialize(),
    // pero Dios da y Dios quita xd
    videoController.initialize();
    chewieController = ChewieController(
      aspectRatio: 9 / 16,
      maxScale: 2.5,
      autoPlay: true,
      autoInitialize: true,
      looping: true,
      showOptions: false,
      showControls: false,
      showControlsOnInitialize: true,
      videoPlayerController: videoController,
    );
  }

  @override
  void dispose() {
    videoController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Chewie(
        controller: chewieController
      ),
    );
  }
}

// Goes into AR stuff
void startDemo() {
  debugPrint("Starting app in demo mode");
}
