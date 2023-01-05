import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

/// Represents Homepage for Navigation
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('পশু পালন'),
      ),
      body:Column(
          children: [

            Container(
              height: 250,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cow_field.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              //padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                //color: Colors.green,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(
                    Radius.circular(0.0) //                 <--- border radius here
                ),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Card(
                  //   elevation: 0,
                  //   child:
                  InkWell(
                      onTap: () {
                        showCustomDialogReceiveDetail(context,'assets/poshu_chikitsa.pdf');
                        // Get.toNamed(Routes.STOCK_RECEIVE);
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffB4E3F6),
                          ),
                          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 150,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.bar_chart_outlined,color: Color(0xff03A1E0),size: 50,),
                              Image(
                                height: 80,
                                width: 80,
                                image: AssetImage(
                                  'assets/thetiscope.png',
                                  //'assets/images/logounhcr.png',
                                ),
                              ),
                              Text(
                                'রোগ ও প্রতিরোধ',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),

                              SizedBox(
                                height: 5,
                              ),

                            ],
                          ),
                        ),
                      )

                  ),
                  //),

                  SizedBox(
                    width: 25,
                  ),
                  // Card(
                  //     elevation: 0,
                  //
                  //   child:
                  GestureDetector(
                      onTap: () {
                        showCustomDialogReceiveDetail(context,'assets/gavipalon.pdf');

                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xffB4E3F6),
                          ),
                          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 150,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Icon(Icons.bar_chart_outlined,color: Color(0xff03A1E0),size: 50,),
                              Image(
                                height: 80,
                                width: 80,
                                image: AssetImage(
                                  'assets/thetiscope.png',
                                  //'assets/images/logounhcr.png',
                                ),
                              ),
                              Text(
                                'গাভী পালন',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),

                              SizedBox(
                                height: 5,
                              ),

                            ],
                          ),
                        ),
                      )
                  ),



                ],
              ),
            ),
          ],
        ),

    );
  }

  void showCustomDialogReceiveDetail(BuildContext context,String pdf) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.white,
      transitionDuration: Duration(milliseconds: 100),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Color(0xff03A1E0),
          appBar: PreferredSize(
            preferredSize: Size(60,55),
            child:  AppBar(
              backgroundColor: Colors.blueAccent,
              elevation: 0,
              centerTitle: true,
              //title: Text('Item Dispatch')

              title: Stack(alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    //child: Text(AppConstant.pageName),),
                    child: Text('গবাদি পশুর রোগ ও প্রতিরোধ'),),

                ],
              ),

            ),
          ),
          body: SfPdfViewer.asset(pdf),

        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }


}
