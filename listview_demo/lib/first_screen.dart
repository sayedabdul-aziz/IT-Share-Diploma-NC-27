import 'package:flutter/material.dart';
import 'package:listview_demo/second_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  List<RestuerentModel> rest = [
    RestuerentModel(
      name: 'KFC',
      decs: 'KFC DESC',
      imagelink:
          'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    ),
    RestuerentModel(
      name: 'eLZA3EEM',
      decs: 'eLZA3EEM DESC',
      imagelink:
          'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    ),
    RestuerentModel(
      name: 'Mac',
      decs: 'Mac DESC',
      imagelink:
          'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    ),
    RestuerentModel(
      name: 'حضر موت المندي',
      decs: 'DESC',
      imagelink:
          'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    ),
    RestuerentModel(
      name: 'السلطان',
      decs: 'DESC',
      imagelink:
          'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    ),
    RestuerentModel(
      name: 'السلطان',
      decs: 'DESC',
      imagelink:
          'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    ),
    RestuerentModel(
      name: 'السلطان',
      decs: 'DESC',
      imagelink:
          'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Demo'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (C) => SeconScreen()));
              },
              icon: const Icon(Icons.reset_tv_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Horizental ListView', style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Item $index'));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 5,
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const Text('Vertical ListView', style: TextStyle(fontSize: 20)),
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: rest.length,
                itemBuilder: (context, index) {
                  return ListViewItem(
                    model: rest[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.model});
  final RestuerentModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey,
      onTap: () {},
      trailing: const Icon(Icons.arrow_circle_right),
      leading: Image.network(model.imagelink),
      title: Text(
        model.name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        model.decs,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
    // Row(
    //   children: [
    //     Image.network(
    //         // 'https://www.creativefabrica.com/wp-content/uploads/2021/05/15/restaurant-logo-Graphics-12037753-1.jpg',
    //         model.imagelink,
    //         width: 90),
    //     const SizedBox(
    //       width: 15,
    //     ),
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             model.name,
    //             style:
    //                 const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //           Text(
    //             model.decs,
    //             style: const TextStyle(fontSize: 16),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}

class RestuerentModel {
  final String name;
  final String decs;
  final String imagelink;

  RestuerentModel(
      {required this.name, required this.decs, required this.imagelink});
}
