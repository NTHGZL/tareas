import 'package:flutter/cupertino.dart';
import 'package:tareas/blocs/item_cubit.dart';
import 'package:tareas/models/item.dart';
import 'package:tareas/widgets/item_widget.dart';

class ListItemWidget extends StatelessWidget{

  final List<Item> items;

  final ItemCubit listItemCubit;

  const ListItemWidget({Key? key, required this.items, required this.listItemCubit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(5.0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              Item item = items[index];
              return ItemWidget(
                  item: item,
                  onPressCheckedButton: ()async
                  {
                    await listItemCubit.updateItems(item);
                  },
                onPressDeletedButton: ()async
                {
                  await listItemCubit.deleteItems(item.id);
                },
              );
            }
        );
  }

}