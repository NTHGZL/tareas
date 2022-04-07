import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/product_cubit.dart';
import 'package:tareas/blocs/task_cubit.dart';
import 'package:tareas/blocs/user_cubit.dart';
import 'package:tareas/models/product.dart';
import 'package:tareas/models/task.dart';
import 'package:tareas/models/user.dart';
import 'package:tareas/repositories/api_repository.dart';
import 'package:tareas/repositories/product_repository.dart';
import 'package:tareas/repositories/task_repository.dart';
import 'package:tareas/repositories/token_repository.dart';
import 'package:tareas/repositories/user_repository.dart';
import 'package:tareas/services/product_service.dart';
import 'package:tareas/services/task_service.dart';
import 'package:tareas/services/token_service.dart';
import 'package:tareas/services/user_service.dart';
import 'package:tareas/ui/screens/home.dart';
import 'package:tareas/ui/screens/list_products_screen.dart';
import 'package:tareas/ui/screens/list_tasks_screen.dart';
import 'package:tareas/ui/screens/login.dart';
import 'package:tareas/ui/screens/public_home.dart';
import 'package:tareas/ui/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TokenRepository tokenRepository = TokenRepository();
  TokenService _tokenService = TokenService(tokenRepository: tokenRepository);
  ApiRepository apiRepository = ApiRepository(tokenRepository);
  UserRepository userRepository = UserRepository(apiRepository);
  TaskRepository taskRepository = TaskRepository(apiRepository);
  ProductRepository productRepository = ProductRepository(apiRepository);

  User? _user;
  List<Task> _tasks = [];
  List<Product> _products = [];


  UserService _userService = UserService(userRepository, tokenRepository);
  TaskService _taskService = TaskService(taskRepository);
  ProductService _productService = ProductService(productRepository);

  final UserCubit userCubit = UserCubit(_user, _userService, _tokenService);
  final TaskCubit taskCubit = TaskCubit(_tasks, _taskService);
  final ProductCubit productCubit = ProductCubit(_products, _productService);
  final String? token = await _tokenService.getToken();
  if(token != null){
    await userCubit.loadUser();
    await taskCubit.loadTasks();
    await productCubit.loadProducts();
  }

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (context) => userCubit),
        BlocProvider<TaskCubit>(create: (context) => taskCubit),
        BlocProvider<ProductCubit>(create: (context) => productCubit),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      routes: {
        '/login' : (context) => const Login(),
        '/register' : (context) => const Register(),
        '/home' : (context) => const Home(),
        '/tasks' : (context) => const ListTasksScreen(),
        '/products' : (context) => const ListProductScreen(),
        '/public_home' : (context) => const PublicHome(),
      },
      home: BlocBuilder<UserCubit, User?>(
        builder: (context, user) {

          if (user == null) {
            return const PublicHome();
          }
          return const Home();
        },
      ),
      );

  }
}
