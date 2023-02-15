import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sadanam/dashboard/homescreen/mapsWebView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.normal);
  final _hotelIntro =
      "Budget Inn Hotel Bellevue is a budget hotel located in the heart of the commercial hubs of Surat."
      "It is a contemporary designed hotel located near the Railway station. It is close to the textile markets, diamond hubs, and most corporate offices in the city."
      "The location provides easy access to restaurants, grocery shops and to the nearby railway station area. "
      "Bellevue is a solution between quality and price by creating a courteous and relaxing environment. We offer the guests warm hospitality and provide them with an opportunity to fulfill their objective of visiting the city. Different category rooms of the hotels are blend of classic, contemporary and minimalist designs with a neutral color palette to enhance the beauty of interiors and to create a serene ambiance in the room. Hotels intimate management feels like a home away from home. Different category rooms offer a different experience and meet with the specified requirements of the guests. The premises also have sufficient large parking space which mostly assures a parking spot and security of the vehicles.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSlideshow(
              indicatorColor: Colors.greenAccent,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 5000,
              isLoop: true,
              height: 280,
              children: [
                Image.asset(
                  'assets/images/Lobby.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/LiveKitchen.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/Restaurant2.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/Suiteroombalcony.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/Sanitization.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Accordion(
              maxOpenSections: 3,
              headerBackgroundColorOpened: Colors.black54,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              disableScrolling: false,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: false,
                  leftIcon:
                      const Icon(Icons.house_rounded, color: Colors.white),
                  headerBackgroundColor: Colors.black,
                  header: Text('Get to know us better', style: _headerStyle),
                  content: Text(_hotelIntro, style: _contentStyle),
                  contentHorizontalPadding: 20,
                  contentBorderWidth: 1,
                  // onOpenSection: () => print('onOpenSection ...'),
                  // onCloseSection: () => print('onCloseSection ...'),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.restaurant_rounded, color: Colors.white),
                  header: Text('Hotel Details', style: _headerStyle),
                  content: DataTable(
                    sortAscending: true,
                    sortColumnIndex: 1,
                    dataRowHeight: 40,
                    showBottomBorder: false,
                    columns: [
                      DataColumn(
                          label: Text('ID', style: _contentStyleHeader),
                          numeric: true),
                      DataColumn(
                          label:
                              Text('Description', style: _contentStyleHeader)),
                      DataColumn(
                          label: Text('Price', style: _contentStyleHeader),
                          numeric: true),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('1',
                              style: _contentStyle,
                              textAlign: TextAlign.right)),
                          DataCell(Text('Fancy Product', style: _contentStyle)),
                          DataCell(Text(r'$ 199.99',
                              style: _contentStyle, textAlign: TextAlign.right))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('2',
                              style: _contentStyle,
                              textAlign: TextAlign.right)),
                          DataCell(
                              Text('Another Product', style: _contentStyle)),
                          DataCell(Text(r'$ 79.00',
                              style: _contentStyle, textAlign: TextAlign.right))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('3',
                              style: _contentStyle,
                              textAlign: TextAlign.right)),
                          DataCell(
                              Text('Really Cool Stuff', style: _contentStyle)),
                          DataCell(Text(r'$ 9.99',
                              style: _contentStyle, textAlign: TextAlign.right))
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('4',
                              style: _contentStyle,
                              textAlign: TextAlign.right)),
                          DataCell(Text('Last Product goes here',
                              style: _contentStyle)),
                          DataCell(Text(r'$ 19.99',
                              style: _contentStyle, textAlign: TextAlign.right))
                        ],
                      ),
                    ],
                  ),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.contact_page, color: Colors.white),
                  header: Text('Contact Us', style: _headerStyle),
                  content: Column(),
                ),
                AccordionSection(
                  isOpen: false,
                  leftIcon: const Icon(Icons.movie, color: Colors.white),
                  header: Text('Tourism', style: _headerStyle),
                  content: const Icon(Icons.movie,
                      size: 200, color: Color(0xff999999)),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InAppMaps()));
                },
                child: Text('Hotel Bellevue Location')),
            // FlutterMap(
            //   options: MapOptions(
            //     center: LatLng(51.509364, -0.128928),
            //     zoom: 8.0,
            //   ),
            //   nonRotatedChildren: [
            //     AttributionWidget.defaultWidget(
            //       source: 'OpenStreetMap contributors',
            //       onSourceTapped: null,
            //     ),
            //   ],
            //   children: [
            //     TileLayer(
            //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            //       userAgentPackageName: 'com.example.app',
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
