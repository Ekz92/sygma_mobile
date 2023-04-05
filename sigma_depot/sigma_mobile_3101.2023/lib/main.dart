import 'package:flutter/material.dart';
import 'package:sigma_mobile/models/user_controller.dart';
import 'package:sigma_mobile/routes.dart';
import 'package:sigma_mobile/screens/home/home_screen.dart';
import 'package:sigma_mobile/utils/database_helper.dart';
import 'package:sigma_mobile/utils/mysql_database_helper.dart';

import 'models/user.dart';
import 'models/user_mysql_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  await DatabaseHelper.init();
  await MysqlDatabaseHelper.init();
  // DatabaseHelper.database.execute('DROP TABLE users');
  // UserMysqlController userMysqlController = UserMysqlController();
  // List<User> remoteUsers = await userMysqlController.list();
  // print(remoteUsers);
  // for (var element in remoteUsers) {
  //   print(element.toMap());
  // }
  // UserController userController = UserController();
  // var user = User(nom: 'Armand 3', prenoms: 'Armand 3', age: 1, sexe: 'Homme');
  // await userController.insert(user);
  // await userMysqlController.insert(user);
  // List users = await userController.list();
  // for (var element in users) {
  //   print(element.toMap());
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigma Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: Colors.black45),
      ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
