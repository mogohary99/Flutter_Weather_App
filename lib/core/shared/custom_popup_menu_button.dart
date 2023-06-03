import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  final List<PopUpMenuItemModel> buttons;
  const CustomPopUpMenuButton({
  super.key, required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert,color: Colors.white,size: 20,),
      onSelected: (value){
        buttons[value].onTap();
      },
      itemBuilder: (context) {
        return buttons.map((e) {
          int index = buttons.indexOf(e);
          return PopupMenuItem(
            value: index,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(e.name),
            ),
          );
        }).toList();
      },
    );
  }
}

class PopUpMenuItemModel extends Equatable{
  final String name;
  final VoidCallback onTap;

  const PopUpMenuItemModel({required this.name, required this.onTap,});

  @override
  List<Object?> get props => [name,onTap];
}