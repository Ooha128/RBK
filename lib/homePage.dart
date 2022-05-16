import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rbk/category_card.dart';
import 'package:rbk/sales.dart';
import 'package:rbk/search_bar.dart';
import 'package:rbk/HomeScreen.dart';
import 'package:rbk/maps.dart';
import 'ToDo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var simpleMapWithPopups = SimpleMapWithPopups;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 250, 203, 242),
              image: DecorationImage(
                image: AssetImage('assets/undraw_pilates_gpdb.png'),
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 239, 188, 130),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/menu.svg'),
                    ),
                  ),
                  Text(
                    'Welcome To \nRBK',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: const [
                        CategoryCard(
                          a: AssetImage('assets/stock.png'),
                          title: 'Fertilizers',
                          path: Home_Screen(),
                        ),
                        CategoryCard(
                          a: AssetImage('assets/Sales.png'),
                          title: 'Sales',
                          path: sales(),
                        ),
                        CategoryCard(
                          a: AssetImage('assets/Todo.png'),
                          title: 'ToDo',
                          path: ToDo(),
                        ),
                        CategoryCard(
                          a: AssetImage('assets/profile.png'),
                          title: 'Nearby RBKs',
                          path: ToDo(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      //bottomNavigationBar: BottomNav(),
    );
  }
}
