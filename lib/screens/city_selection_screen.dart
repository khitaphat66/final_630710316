import 'package:flutter/material.dart';

class CitySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height, // ความสูงเท่ากับความสูงของหน้าจอ
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // ชิดด้านบน
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/weather', arguments: 'Bangkok');
                    },
                    child: Text('Bangkok',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),),

                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/weather', arguments: 'Paris');
                    },
                    child: Text('Paris',
                      style: TextStyle(
                      fontSize: 25.0,
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
