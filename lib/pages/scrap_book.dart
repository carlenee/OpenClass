import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:merrymas/app_color.dart';
import 'package:merrymas/models/scrap_journey.dart';
import 'package:merrymas/pages/journey.dart';

import '../widgets/custom_card.dart';

class ScrapBookPage extends StatelessWidget {
  const ScrapBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF5038BC), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.9])),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            InkWell(
              child: SizedBox(
                height: 600,
                child: Swiper(
                  itemCount: ScrapJourney.scrapJourney.length,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemHeight: MediaQuery.of(context).size.height,
                  layout: SwiperLayout.TINDER,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: AppColor.ungu,
                          activeColor: Colors.white,
                          activeSize: 12,
                          space: 4)),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation,
                                        secondaryAnimation) =>
                                    JourneyDetailPage(
                                        scrapJourney:
                                            ScrapJourney.scrapJourney[index])));
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              CustomCard(
                                name: ScrapJourney.scrapJourney[index].name,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Hero(
                                tag: ScrapJourney.scrapJourney[index].position,
                                child: Image.asset(ScrapJourney
                                    .scrapJourney[index].iconImage)),
                          )
                        ],
                      ),
                    );
                  },
                ),
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
        )),
      ),
    );
  }
}
