import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_and_bloc_app/bottom_nav.dart';
import 'package:provider_and_bloc_app/provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> UserProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomNavigation(),
      ),
    );
  }
}


// Step 1: Create a data provider class
// class CounterProvider with ChangeNotifier {
//   int _count = 0;
//
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(
//     // Step 2: Wrap your app with MultiProvider
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CounterProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Provider Example',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Step 3: Use the Consumer widget to access data
//     return Consumer<CounterProvider>(
//       builder: (context, counterProvider, child) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Counter App'),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Count:',
//                   style: TextStyle(fontSize: 24),
//                 ),
//                 Text(
//                   '${counterProvider.count}',
//                   style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               // Step 4: Trigger state update
//               counterProvider.increment();
//             },
//             child: const Icon(Icons.add),
//           ),
//         );
//       },
//     );
//   }
// }

