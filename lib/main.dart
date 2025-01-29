import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_app/firebase_options.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then(
    (_){}
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routes: {
        '/': (_) => const Screen1(),
        '/screen34': (_) => const Screen34()
      },
      getPages: [
        GetPage(name: '/', page: () => const Screen1()),
        GetPage(name: '/screen34', page: () => const Screen34())
      ],
      // home: Screen1()
    );
  }
}



class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the first screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Single Navigation: Default Flutter Navigation'
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Screen34()
                  )
                );
              },
              child: const Text('Default Navigation'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Get.to(const Screen34());
              },
              child: const Text('Getx Navigation'),
            ),


            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/screen34');
              },
              child: const Text('Default Named Navigation2'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: (){
                Get.toNamed('/screen34');
              },
              child: const Text('Getx Named Navigation2'),
            ),


            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: (){
                Get.toNamed('/screen34', arguments: 'I love how you do me');
              },
              child: const Text('Getx pass data'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: (){
                Get.toNamed('/screen34?name=emmanuel&surname=nnanna');
              },
              child: const Text('Pass data in url'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Get.toNamed('/screen34'),
              child: const Text('pass data in url with arguments'),
            )
          ],
        ),
      )
    );
  }
}


class Screen34 extends StatelessWidget {
  const Screen34({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is the second screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Get.parameters['name'] ?? ''
            ),
            Text(
              Get.parameters['surname'] ?? ''
            ),
            Text(
              'Emmanuel was a brilliant student before',
              style: Theme.of(context).textTheme.headlineMedium
            ),
            Text(
              'Emmanuel is no longer a brilliant student',
              style: Theme.of(context).textTheme.bodySmall
            )
          ],
        ),
      ),
    );
  }
}