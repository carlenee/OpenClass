import 'package:flutter/material.dart';
import 'package:merrymas/models/scrap_journey.dart';

import '../app_color.dart';

class JourneyDetailPage extends StatelessWidget {
  final ScrapJourney scrapJourney;

  const JourneyDetailPage({Key? key, required this.scrapJourney})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kuning,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 300,
                        ),
                        Text(
                          scrapJourney.name,
                          style: TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.w900,
                              color: AppColor.ungu,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          scrapJourney.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColor.ungu,
                              fontFamily: 'Avenir'),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 10),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: AppColor.ungu,
                          fontFamily: 'Avenir'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ListView.builder(
                        itemCount: scrapJourney.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  scrapJourney.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                right: -64,
                child: Hero(
                    tag: scrapJourney.position,
                    child: Image.asset(
                      scrapJourney.iconImage,
                      width: 370,
                      height: 300,
                    ))),
            Positioned(
              left: 32,
              top: 60,
              child: Text(
                scrapJourney.position.toString(),
                style: TextStyle(
                    fontSize: 247,
                    color: AppColor.ungu.withOpacity(0.08),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            )
          ],
        ),
      ),
    );
  }
}
