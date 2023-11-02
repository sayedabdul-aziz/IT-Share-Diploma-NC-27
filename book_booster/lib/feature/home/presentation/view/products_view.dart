import 'package:book_booster/feature/home/data/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('product').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot<Map<String, dynamic>>> document =
                  snapshot.data!.docs;

              return Expanded(
                child: GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> data = document[index].data();
                    return Container(
                      height: 260,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              data['image'],
                              height: 180,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(data['name']),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '${data['price'].toString()} EGP',
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_outline))
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: const Text('Add to Cart'),
                          )
                        ],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .6),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     for (int e = 0; e < AllProducts.length; e++) {
                //       var data = {
                //         'id': AllProducts[e].id,
                //         'name': AllProducts[e].name,
                //         'category': AllProducts[e].category,
                //         'description': AllProducts[e].description,
                //         'image': AllProducts[e].image,
                //         'quantity': AllProducts[e].quantity,
                //         'price': AllProducts[e].price,
                //       };
                //       print(data);
                //       await FirebaseFirestore.instance
                //           .collection("product")
                //           .add(data)
                //           .then((DocumentReference doc) =>
                //               print('DocumentSnapshot added with ID: ${doc.id}'));
                //     }
                //   },
                // child: const Text('ارفع'),
                // )
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    ));
  }
}

List<products> AllProducts = [
  products(
    id: 2,
    name: 'Brain Connections',
    category: 'Psychology',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/p1.png',
    quantity: 1,
    price: 329,
  ),
  products(
    id: 3,
    name: 'Public Finance',
    category: '️Finance',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/ff1.png',
    quantity: 1,
    price: 59,
  ),
  products(
    id: 4,
    name: 'Subtle Art',
    category: 'Self-Help',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/s1.png',
    quantity: 1,
    price: 129,
  ),
  products(
    id: 1,
    name: 'Out Last Summer',
    category: 'Fiction',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/fiction/f1.png',
    quantity: 1,
    price: 459,
  ),
  products(
    id: 2,
    name: 'Creative Brain',
    category: 'Psychology',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/p2.png',
    quantity: 1,
    price: 659,
  ),
  products(
    id: 4,
    name: 'Inner Healing',
    category: 'Self-Help',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/s2.png',
    quantity: 1,
    price: 259,
  ),
  products(
    id: 3,
    name: 'Power of Invest',
    category: 'Finance',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/ff2.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 1,
    name: 'The Secrets',
    category: 'fiction',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/fiction/f2.png',
    quantity: 1,
    price: 699,
  ),
  products(
    id: 2,
    name: 'The Human Brain',
    category: 'Psychology',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/p3.png',
    quantity: 1,
    price: 269,
  ),
  products(
    id: 3,
    name: 'Corporate',
    category: 'Finance',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/ff3.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 4,
    name: 'Zen',
    category: 'Self-Help',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/s3.png',
    quantity: 1,
    price: 29,
  ),
  products(
    id: 1,
    name: 'Mastermind',
    category: 'Fiction',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/fiction/f3.png',
    quantity: 1,
    price: 369,
  ),
  products(
    id: 1,
    name: 'Ink & Stars',
    category: 'Fiction',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/fiction/f4.png',
    quantity: 1,
    price: 569,
  ),
  products(
    id: 4,
    name: 'Anxity',
    category: 'Self-Help',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/s4.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 3,
    name: 'More Money',
    category: 'Finance',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/ff5.png',
    quantity: 1,
    price: 99,
  ),
  products(
    id: 1,
    name: 'The Garden',
    category: 'Fiction',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/fiction/f5.png',
    quantity: 1,
    price: 999,
  ),
  products(
    id: 2,
    name: 'Human Brain',
    category: 'Psychology',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/p4.png',
    quantity: 1,
    price: 369,
  ),
  products(
    id: 4,
    name: 'Power',
    category: 'Self-Help',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/s5.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 1,
    name: '''Dragon's mother''',
    category: 'Fiction',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/fiction/f6.png',
    quantity: 1,
    price: 859,
  ),
  products(
    id: 3,
    name: 'Shallow',
    category: 'Finance',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/ff6.png',
    quantity: 1,
    price: 19,
  ),
  products(
    id: 4,
    name: 'Alchemist',
    category: 'Self-Help',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/s6.png',
    quantity: 1,
    price: 99,
  ),
  products(
    id: 2,
    name: 'Typography',
    category: 'Psychology',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/p5.png',
    quantity: 1,
    price: 159,
  ),
  products(
    id: 2,
    name: 'Element Spritives',
    category: 'Psychology',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/p6.png',
    quantity: 1,
    price: 789,
  ),
  products(
    id: 3,
    name: 'Black freedom',
    category: 'Finance',
    description: 'This Book is a good book to read with it.',
    image: 'assets/images/stocks/ff4.png',
    quantity: 1,
    price: 79,
  ),
];
