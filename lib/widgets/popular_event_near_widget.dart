import 'package:flutter/material.dart';

List RandomImages = [
  'assets/images/avatar_4.png',
  'assets/images/avatar_3.png',
  'assets/images/avatar_2.png',
];

class PopularEventNearWidget extends StatelessWidget {
  const PopularEventNearWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/images/popular_near_bg.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      width: 320,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.transparent, // Light blue color
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Popular events near you!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 200),
              const Text(
                "Unleash the fun! Explore the world of exciting events happening near you",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18),
                          elevation: 20,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: () {},
                      child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'See More',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < RandomImages.length; i++)
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 0),
                                child: Align(
                                    widthFactor: 0.5,
                                    child: CircleAvatar(
                                      radius: 22,
                                      //backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 22,
                                        backgroundImage: NetworkImage(
                                          RandomImages[i],
                                        ),
                                      ),
                                    )),
                              )
                          ],
                        ),
                      ],
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
