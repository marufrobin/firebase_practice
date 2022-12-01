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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            buildAddStudent(context);
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xff42ED18)),
    );
  }

  Future<dynamic> buildAddStudent(BuildContext context) {
    return showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.66,
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                margin: EdgeInsets.only(
                  top: 80,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26),
                      topLeft: Radius.circular(26)),
                  color: Color(0xffCCF1D4),
                ),
                child: Column(
                  children: [
                    TextField(
                        decoration: InputDecoration(hintText: "Enter name")),
                  ],
                ),
              ),
              Positioned(
                left: 116,
                child: CircleAvatar(
                  backgroundColor: Color(0xffE2FCE7),
                  radius: 80,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_photo_alternate_rounded,
                        size: 30,
                        color: Color(0xff795D5D),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
