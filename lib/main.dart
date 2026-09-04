import 'package:flutter/material.dart';

void main() => runApp(const MetalAIRobotPro());

class MetalAIRobotPro extends StatefulWidget {
  const MetalAIRobotPro({super.key});
  @override State<MetalAIRobotPro> createState() => _MetalAIRobotProState();
}

class _MetalAIRobotProState extends State<MetalAIRobotPro>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true);

  final List<String> chat = [
    '🤖 مرحباً! أنا Metal AI Robot PRO.',
    '🤖 Hello! I am Metal AI Robot PRO.'
  ];
  final input = TextEditingController();

  @override
  void dispose() { _pulse.dispose(); input.dispose(); super.dispose(); }

  void send() {
    final text = input.text.trim();
    if (text.isEmpty) return;
    setState(() {
      chat.add('👤 $text');
      chat.add('🤖 تم استلام رسالتك. الاتصال بالذكاء الاصطناعي السحابي سيُضاف في المرحلة التالية.');
      input.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Metal AI Robot PRO'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.psychology)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          ],
        ),
        body: Column(children: [
          SizedBox(height: 300, child: AnimatedBuilder(
            animation: _pulse,
            builder: (_, __) => CustomPaint(
              painter: RobotPainter(_pulse.value),
              child: const Center(),
            ),
          )),
          Expanded(child: ListView(
            padding: const EdgeInsets.all(12),
            children: chat.map((x) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(x, style: const TextStyle(fontSize: 16)),
            )).toList(),
          )),
          SafeArea(child: Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
            Expanded(child: TextField(
              controller: input,
              onSubmitted: (_) => send(),
              decoration: const InputDecoration(hintText: 'اكتب رسالة / Type a message'),
            )),
            IconButton(onPressed: send, icon: const Icon(Icons.send)),
          ])),
        ]),
      ),
    );
  }
}

class RobotPainter extends CustomPainter {
  final double pulse;
  RobotPainter(this.pulse);
  @override
  void paint(Canvas c, Size s) {
    final x = s.width / 2, y = 135 + pulse * 5;
    final body = Paint()..shader = const LinearGradient(
      colors: [Color(0xffe7ebef), Color(0xff68727c), Color(0xff20272e)])
      .createShader(Rect.fromLTWH(x - 90, y, 180, 170));
    final dark = Paint()..color = const Color(0xff10161c);
    final eye = Paint()..color = Colors.cyanAccent;
    c.drawRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(x, y + 70), width: 150, height: 155),
      const Radius.circular(34)), body);
    c.drawRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(x, y - 25), width: 175, height: 115),
      const Radius.circular(38)), body);
    c.drawRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(x, y - 25), width: 135, height: 72),
      const Radius.circular(24)), dark);
    c.drawCircle(Offset(x - 34, y - 27), 11, eye);
    c.drawCircle(Offset(x + 34, y - 27), 11, eye);
    c.drawRect(Rect.fromLTWH(x - 25, y + 3, 50, 5), eye);
    c.drawCircle(Offset(x, y + 65), 20, dark);
    c.drawCircle(Offset(x, y + 65), 9, eye);
  }
  @override bool shouldRepaint(covariant RobotPainter oldDelegate) => true;
}
