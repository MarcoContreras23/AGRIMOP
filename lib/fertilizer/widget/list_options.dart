import 'package:agri_mop/utils/card_options.dart';
import 'package:agri_mop/utils/use_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

const String description =
    "";
// CLASS TO SHOW OPTIONS DIALOGS ABOUT FERTILIZER
class ListOptions extends StatelessWidget {
  const ListOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 1,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      separatorBuilder: (_, index) => const Divider(height: 30),
      itemBuilder: (_, index) => CardOptions(
        icon: FontAwesome.leaf,
        title: "Analizar Fertilizantes",
        description: description,
        onTap: () async => useNavigatePushName(context, "fertilizerView"),
      ),
    );
  }
}
