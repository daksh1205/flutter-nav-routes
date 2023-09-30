import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstScreen = true;

  setFirstScreen(screenValue) {
    setState(() {
      isFirstScreen = screenValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
          pages: [
            MaterialPage(
              child: FirstScreen(setFirstScreen),
            ),
            if (isFirstScreen == false)
              MaterialPage(
                child: SecondScreen(setFirstScreen),
              ),
          ],
          onPopPage: (route, result) {
            bool popStatus = route.didPop(result);
            if (popStatus == true) setFirstScreen(true);
            return popStatus;
          }),
    );
    //(initialRoute: '/', routes: {
    //   '/': (context) => const FirstScreen(),
    //   '/second': (context) => const SecondScreen(),
    // }
  }
}

class FirstScreen extends StatelessWidget {
  final Function setFirstScreen;

  const FirstScreen(this.setFirstScreen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => setFirstScreen(false),
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SecondScreen()));

                // Navigator.pushNamed(
                //   context,
                //   '/second',
                // );

                child: Text('Go to Screen Two'))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final Function setFirstScreen;

  const SecondScreen(this.setFirstScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text('Second Screen'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () => setFirstScreen(true),
                // {
                //   Navigator.pop(context);
                //   // Navigator.push(context,
                //   //     MaterialPageRoute(builder: (context) => FirstScreen()));
                // },
                child: Text('Return to Screen 1'))
          ],
        )));
  }
}
