library flutter_modal_dropdown;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermodaldropdown/inc/model.dart';

import 'inc/styles.dart';

class CustomModalDropDown extends StatelessWidget {
  final String? title;
  final String? placeholder;
  final BuildContext? context;
  List<Map<String, dynamic>>? items;
  Function? onChangeValue;

  CustomModalDropDown(
      {Key? key,
      this.title,
      this.placeholder,
      this.context,
      this.items,
      this.onChangeValue})
      : super(key: key);

  List<SelectModel>? dropDownItems;
  GlobalKey itemKey = GlobalKey();

  getPosition(GlobalKey key) {
    RenderBox rb = key.currentContext?.findRenderObject() as RenderBox;
    return rb.localToGlobal(Offset.zero);
  }

  initData() {
    dropDownItems = items?.map((i) => SelectModel.fromJson(i)).toList();
  }

  onTapValue(value, index) {
    if (kDebugMode) {
      print('value ===> $value');
      print('index ===> $index');

      onChangeValue!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    initData();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      displayTitle(title),
      mainContainer(() {
        double y = getPosition(itemKey).dy;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Material(
                type: MaterialType.transparency,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: mediaSize.height * 0.32,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: y + 20),
                      child: ListView.builder(
                          itemCount: dropDownItems?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(context);

                                onTapValue(
                                    dropDownItems?[index].id, index);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: mediaSize.width * 0.036),
                                child: Container(
                                  height: mediaSize.height * 0.058,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            173, 173, 173, 1),
                                        width: 0.5),
                                  ),
                                  margin: const EdgeInsets.only(bottom: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mediaSize.width * 0.028,
                                      vertical: mediaSize.height * 0.018),
                                  child: Text(
                                    "${dropDownItems?[index].displayName!}",
                                    style: Styles.generateRedMediumFont(
                                        const Color.fromRGBO(42, 42, 42, 1),
                                        0.0,
                                        14),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            });
      }, itemKey),
    ]);
  }

  Widget mainContainer(VoidCallback? onPress, Key containerKey) {
    final mediaSize = MediaQuery.of(context!).size;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        key: containerKey,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: const Color.fromRGBO(173, 173, 173, 1), width: 0.5),
        ),
        margin: EdgeInsets.only(bottom: mediaSize.height * 0.023),
        padding: EdgeInsets.symmetric(
            horizontal: mediaSize.width * 0.028,
            vertical: mediaSize.height * 0.018),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              placeholder!,
            ),
          ],
        ),
      ),
    );
  }

  Widget displayTitle(String? title) {
    final mediaSize = MediaQuery.of(context!).size;
    return Padding(
      padding: EdgeInsets.only(bottom: mediaSize.height * 0.006),
      child: Text(
        title!,
      ),
    );
  }
}
