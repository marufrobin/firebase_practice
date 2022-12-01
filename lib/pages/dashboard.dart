import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Color(0xff42ED18),
              size: 36,
            )),
        title: Text("Student Management",
            style: TextStyle(color: Color(0xff575252))),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: Color(0xff42ED18),
                size: 30,
              ))
        ],
      ),
      body: GridView.count(
          childAspectRatio: (1 / 1.2),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          children: List.generate(
              16,
              (index) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff42ED18), width: 2),
                        color: Color(0xffCCF1D4),
                        borderRadius: BorderRadius.circular(16)),
                    margin: EdgeInsets.all(4),
                  ))),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
