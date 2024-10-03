import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button2.dart';
import 'package:swiggy_clone_project/View/Reorder%20Screen/Widgets/reorders_card.dart';
import 'package:swiggy_clone_project/View/dummy_db.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';
import 'package:swiggy_clone_project/utils/constants/image_constants.dart';

class ReorderScreen extends StatefulWidget {
  const ReorderScreen({super.key});

  @override
  State<ReorderScreen> createState() => _ReorderScreenState();
}

class _ReorderScreenState extends State<ReorderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.SCAFFOLD_BG,
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _categoryButtons(),
            ),
            SizedBox(
              height: 20,
            ),
            _orderedItems()
          ],
        ),
      ),
    );
  }

  Expanded _orderedItems() {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, Index) => ReordersCard(
                foodimg: dummydb3.RecDishDetails[Index]["img"],
                time: dummydb2.hoteldetails[Index]["time"],
                hotelname: dummydb2.hoteldetails[Index]["name"],
                price: dummydb3.RecDishDetails[Index]["price"],
                foodname: dummydb3.RecDishDetails[Index]["dishname"],
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 15,
              ),
          itemCount: 5),
    );
  }

  Row _categoryButtons() {
    return Row(
      children: [
        SizedBox(width: 15),
        common_button2(
          onPressed: () {},
          buttonText: "Favourites",
        ),
        SizedBox(width: 10),
        common_button2(
          onPressed: () {},
          buttonText: "Price 149 - 300",
        ),
        SizedBox(width: 10),
        common_button2(
          onPressed: () {},
          buttonText: "Price >300",
        ),
        SizedBox(width: 10),
      ],
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text("REORDER"),
      titleTextStyle: TextStyle(
          color: ColorConstants.mainblack,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      centerTitle: true,
    );
  }
}
