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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterNotifierProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
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