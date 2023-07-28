import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/radio_model.dart';

class AddressListTile extends StatefulWidget {
  const AddressListTile({Key? key, required this.sampleData}) : super(key: key);
  final List<RadioModel> sampleData;

  @override
  State<AddressListTile> createState() => _AddressListTileState();
}

class _AddressListTileState extends State<AddressListTile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: widget.sampleData.map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            tileColor:  e.isSelected
                ? Colors.white
                : Color(0xffE5E5E5),
            leading: InkWell(
              //highlightColor: Colors.red,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  for (var element in widget.sampleData) {
                    element.isSelected = false;
                  }
                  e.isSelected = true;
                });
              },
              child: Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: e.isSelected
                        ? const Color(ColorManager.mainColor)
                        : Colors.transparent,
                    border: Border.all(
                        width: 1,
                        color: e.isSelected
                            ? const Color(ColorManager.mainColor)
                            : Colors.grey),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.done_rounded,
                      color: e.isSelected ? Colors.white : Colors.transparent,
                      //fontWeight: FontWeight.bold,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            // horizontalTitleGap: 17,
            // minVerticalPadding: ,
            title: Text(
              e.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    e.number,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  e.place,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          ),
        );
      }).toList(),
    );
  }
}
