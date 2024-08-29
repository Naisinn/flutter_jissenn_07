import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetProvider = Provider((ref) {
  return 'Hello, Flutter!!';
}); // ❶

class HomePage extends ConsumerWidget { // ❷
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greet = ref.watch(greetProvider); // ❸
    return Center(
      child: Text(greet),
    );
  }
}

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() {
    state = state + 1;
  }
}


final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(() {
  return CounterNotifier();
});