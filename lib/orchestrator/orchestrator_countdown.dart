import 'dart:async';

import 'package:fight_for_initiative/orchestrator/orchestrator.dart';
import 'package:flame/components.dart';

class OrchestratorCountdown extends PositionComponent
    with ParentIsA<Orchestrator> {
  Timer? _timer;

  double timerDuration;
  Timer get timer => _timer ??= Timer(
    timerDuration,
    autoStart: false,
    onTick: parent.timerComplete,
  );

  TextComponent? _textComponent;

  TextComponent get textComponent => _textComponent ??= _getTextComponent();

  OrchestratorCountdown(Vector2 position, this.timerDuration)
    : super(position: position);

  bool get running => timer.isRunning();

  start() {
    timer.reset();
    print("Timer start");
    timer.start();
  }

  stop() {
    print("Timer stop");
    timer.stop();
    timer.reset();
  }

  @override
  FutureOr<void> onLoad() {
    add(textComponent);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    timer.update(dt);
    if (timer.isRunning() && timer.limit - timer.current < 5) {
      print((timer.limit - timer.current).ceil().toStringAsFixed(0));
      textComponent.text = (timer.limit - timer.current).ceil().toStringAsFixed(
        0,
      );
    }
  }

  TextComponent _getTextComponent() {
    final textComponent = TextComponent(text: "Test Text");
    return textComponent;
  }
}
