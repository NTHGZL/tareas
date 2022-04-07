import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/product_cubit.dart';
import 'package:tareas/widgets/create_item_form.dart';
import 'package:tareas/widgets/list_item_widget.dart';

import '../../models/product.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({Key? key}) : super(key: key);

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Mes Courses'),
        backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1), () {
            context.read<ProductCubit>().loadProducts();
          });
        },
        child: SingleChildScrollView(
          child: BlocBuilder<ProductCubit, List<Product>>(
              builder: (context, products){
                List<Product> notCompleteProducts = products.where((product) => !product.completed).toList();
                List<Product> completeProducts = products.where((product) => product.completed).toList();
                return Column(
                    children:  [
                      ListItemWidget(
                        items: notCompleteProducts,
                        listItemCubit: context.read<ProductCubit>(),
                      ),
                      InkWell(
                        child: Row(
                          children:  [
                            isVisible ? const RotatedBox(quarterTurns: 1, child: Icon(Icons.chevron_right, color: Colors.white,) ,) : const Icon(Icons.chevron_right, color: Colors.white,),
                            Text('Terminées ('+completeProducts.length.toString()+')', style: const TextStyle(fontSize: 20, color: Colors.white)),
                          ],
                        ),
                        onTap: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      if(isVisible) ListItemWidget(items: completeProducts, listItemCubit: context.read<ProductCubit>())
                    ],
                  );

              }
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            backgroundColor: const Color.fromRGBO(40, 40, 40, 1.0),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child:  SizedBox(

                    height: 100,
                    child: CreateItemForm(itemCubit: context.read<ProductCubit>())
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, size: 30,),

      ),
    );

  }
}