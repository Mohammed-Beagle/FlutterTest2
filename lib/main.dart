import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Test 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CardItem> cryptosList = [
    CardItem(
        color: Color(0xFFE6EE09),
        title: 'BTC',
        price: '9 351,30 €',
        percentage: '2,17 %',
        sign: true),
    CardItem(
        color: Color(0xFF0090F7),
        title: 'XRP',
        price: '0,75 €',
        percentage: '2,17 %',
        sign: false),
    CardItem(
        color: Color(0xFFE70909),
        title: 'ETH',
        price: '351,30 €',
        percentage: '0,17 %',
        sign: true),
    CardItem(
        color: Color(0xFF28EDA5),
        title: 'DTC',
        price: '8 501,30 €',
        percentage: '3,17 %',
        sign: true),
    CardItem(
        color: Color(0xFF364A54),
        title: 'GGT',
        price: '5 351,30 €',
        percentage: '5,17 %',
        sign: false),
    CardItem(
        color: Color(0xFF994A84),
        title: 'GGT',
        price: '5 351,30 €',
        percentage: '5,17 %',
        sign: false),
  ];

  List<CardItem> tokensList = [
    CardItem(
        color: Color(0xFF9513FF),
        title: 'DENT',
        price: '7 351,30 €',
        percentage: '12,17 %',
        sign: false),
    CardItem(
        color: Color(0xFF00FDF9),
        title: 'UNI',
        price: '15,75 €',
        percentage: '22,17 %',
        sign: true),
    CardItem(
        color: Color(0xFF93DF35),
        title: 'AAVE',
        price: '551,30 €',
        percentage: '21,17 %',
        sign: false),
    CardItem(
        color: Color(0xFFFFC402),
        title: 'DMA',
        price: '4 510,30 €',
        percentage: '6,17 %',
        sign: true),
    CardItem(
        color: Color(0xFF00AAFF),
        title: 'TOCE',
        price: '20 351,30 €',
        percentage: '500,17 %',
        sign: true),
    CardItem(
        color: Color(0xFFFF00BB),
        title: 'THT',
        price: '2 351,30 €',
        percentage: '5,17 %',
        sign: false),
  ];

  late ListCards cryptos;
  late ListCards tokens;

  @override
  void initState() {
    cryptos = ListCards(title: 'Cryptos', items: cryptosList);
    tokens = ListCards(title: 'Tokens', items: tokensList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 410,
              title: Text("Investments"),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: buildPromotionWidget(),
              ),
            ),
            buildCardsList(cryptos),
            buildCardsList(tokens),
            buildCardsList(cryptos),
            buildCardsList(tokens),
          ],
        ));
  }

  Widget buildPromotionWidget() => Stack(
        children: [
          Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/image.png')),
          Positioned(
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      'AKT Token',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Text(
                          'Purchase our exclusive token with 25% bonus\n& get your lifetime Elite membership now',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Learn more',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            FontAwesomeIcons.arrowRightLong,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      );

  Widget buildCardsList(list) => SliverToBoxAdapter(
          child: Container(
        height: 215,
        margin: EdgeInsets.all(15),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.items.length,
            itemBuilder: (context, index) => index == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Text(
                          list.title,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      buildCard(list.items[index]),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      buildCard(list.items[index]),
                    ],
                  )),
      ));

  Widget buildCard(item) => Container(
        margin: EdgeInsets.only(right: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: item.color,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              item.price,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Row(
              children: [
                item.sign
                    ? Icon(
                        FontAwesomeIcons.arrowTrendUp,
                        color: Colors.green,
                      )
                    : Icon(
                        FontAwesomeIcons.arrowTrendDown,
                        color: Colors.red,
                      ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  item.percentage,
                  style: TextStyle(
                      color: item.sign ? Colors.green : Colors.red,
                      fontSize: 16),
                ),
              ],
            )
          ],
        ),
      );
}

class CardItem {
  final Color color;
  final String title;
  final String price;
  final String percentage;
  final bool sign;

  const CardItem(
      {required this.color,
      required this.title,
      required this.price,
      required this.percentage,
      required this.sign});
}

class ListCards {
  final String title;
  final List<CardItem> items;

  const ListCards({required this.title, required this.items});
}
