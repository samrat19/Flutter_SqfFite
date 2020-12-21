import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/components/caption_text.dart';
import 'package:food/components/display_food_item.dart';
import 'package:food/components/menu_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/designed_circle.dart';
import 'logic/model/food_item_model.dart';

void main() {
  runApp(FoodApp());
}


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisplayScreen(),
    );
  }
}


class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {

  bool isVeg = true;


  List<FoodItemModel> foodItems = [
    FoodItemModel(
        imagePath: 'asset/chicken-chowmein.jpg',
        itemName: 'Chicken Chowmein',
        itemPrice: '180/-',
    ),
    FoodItemModel(
      imagePath: 'asset/chicken-chowmein.jpg',
      itemName: 'Chicken Chowmein',
      itemPrice: '180/-',
    ),
    FoodItemModel(
      imagePath: 'asset/chicken-chowmein.jpg',
      itemName: 'Chicken Chowmein',
      itemPrice: '180/-',
    ),
    FoodItemModel(
      imagePath: 'asset/chicken-chowmein.jpg',
      itemName: 'Chicken Chowmein',
      itemPrice: '180/-',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.57,
                  left: MediaQuery.of(context).size.width*0.4,
                  child: DesignedCircle(color: Colors.yellow[700],),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.57,
                right: MediaQuery.of(context).size.width*0.4,
                child: DesignedCircle(color:isVeg?Colors.green[800]:Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    MenuButton(
                      color: isVeg?Colors.green[800]:Colors.red,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CaptionText(),
                    /*here goes the genres*/
                    beverageType(),
                    /*here goes the item list*/
                    // Expanded(
                    //   flex: 1,
                    //   child: ListView(
                    //     children: foodItems.map((foodItem)=>DisplayFoodItem(
                    //       foodItem: foodItem,
                    //     )).toList(),
                    //   ),
                    //),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget beverageType(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              isVeg = true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isVeg?Colors.green[800]:Colors.transparent,
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 18.0,
              ),
              child: Text('veg',style: GoogleFonts.sacramento(
                color: isVeg?Colors.white:Colors.green[800],
                fontSize: 45.0,
                height: 1.0,
              ),),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              isVeg = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isVeg?Colors.transparent:Colors.red,
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 16.0,
              ),
              child: Text('non veg',style: GoogleFonts.sacramento(
                color: isVeg?Colors.redAccent:Colors.white,
                fontSize: 45.0,
                height: 1.0,
              ),),
            ),
          ),
        ),
      ],
    );
  }
}