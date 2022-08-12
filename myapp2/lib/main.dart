import 'package:flutter/material.dart';
import 'package:myapp2/providers/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
                "You have pushed the button this many times: ${context.watch<Counter>().count}"),
            Count(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: const Key("decrement_floatingActionButton"),
            onPressed: () => context.read<Counter>().decrement(),
            tooltip: "Decrement",
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            key: const Key("reset_floatingActionButton"),
            onPressed: () => context.read<Counter>().reset(),
            tooltip: "Reset",
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            key: const Key("increment_floatingActionButton"),
            onPressed: () => context.read<Counter>().increment(),
            tooltip: "Increment",
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(context.watch<Counter>().count.toString());
  }
}
