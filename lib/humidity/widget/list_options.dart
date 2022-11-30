import 'package:agri_mop/models/ListitemSectionModel.dart';
import 'package:agri_mop/utils/card_options.dart';
import 'package:agri_mop/utils/use_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


  List<ListSectionModel> listOptions=[
    const ListSectionModel(icon: FontAwesome.leaf, title: 'Analizar Fertilizantes', description: '', route: 'fertilizerView'),
    const ListSectionModel(icon: FontAwesome.shopping_bag, title: 'Analizar Humedad', description: '', route: 'humidityView'),
  ];
// CLASS TO SHOW OPTIONS DIALOGS ABOUT FERTILIZER
class ListOptions extends StatelessWidget {
  const ListOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    return ListView.separated(
      itemCount: listOptions.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      separatorBuilder: (_, index) => const Divider(height: 30),
      itemBuilder: (_, index) {
        final element=listOptions[index];
       return  CardOptions(
        icon: element.icon,
        title: element.title,
        description: element.description,
        onTap: () async => useNavigatePushName(context, element.route),
      );}
    );
  }
}
