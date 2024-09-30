import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_and_bloc_app/provider/user_provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final TextEditingController userNameController=TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text('UserName',style: TextStyle(fontSize: 20),),
                Text(context.watch<UserProvider>().userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

              ],

            ),
            const SizedBox(height: 10,),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 10,),

            ElevatedButton(onPressed: (){
              context.read<UserProvider>().changeUserName(newUserName: userNameController.text);
              FocusManager.instance.primaryFocus?.unfocus();
              userNameController.clear();
            },
                child:const Text('Save')
            ),
          ],
        ),
      ),
    );
  }
  }
