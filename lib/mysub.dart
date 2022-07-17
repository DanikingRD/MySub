import 'package:flutter/material.dart';

class MySubApp extends StatelessWidget {

  const MySubApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySub',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('MySub'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Work in progress!'),
          ),
        )
    );
  }
}
