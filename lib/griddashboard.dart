import 'package:flutter/material.dart';
import 'model/items.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "Wisata",
    subtitle: "March, Wednesday",
    event: "3 Events",
    img: "assets/calendar.png",
    route: '/wisata',
  );

  Items item2 = new Items(
    title: "Informasi",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "assets/food.png",
    route: '/info',
  );
  Items item3 = new Items(
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/map.png",
    route: '/location',
  );
  Items item4 = new Items(
    title: "About",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/festival.png",
    route: '/about',
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    return Container(
      child: Flexible(
        child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.only(top: 8, left: 16, right: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: myList.map((data) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, data.route);
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Second()));
                },
                splashColor: Colors.blue,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, spreadRadius: 3)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        alignment: Alignment.topCenter,
                        icon: Image.asset(
                          data.img,
                          width: 45,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, data.route);
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, data.route);
                        },
                        child: Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
