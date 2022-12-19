import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png'
  ];

  final List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : const Color(0xffC4C4C4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
        ),
      );
    }

    Widget header() {
      // awal index = -1;
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.chevron_left),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map((image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, _) {
                setState(() => currentIndex = index);
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((_) {
              index++; // ketika index++ maka index awal -1 menjadi 0
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 17),
          padding: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            color: backgroundColor1,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // NOTE: HEADER
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TERREX URBAN LOW',
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              'Hiking',
                              style: primaryTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/button_wishlist.png', width: 46),
                    ],
                  ),
                ),
                // NOTE: PRICE
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: defaultMargin),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price starts from',
                        style: primaryTextStyle,
                      ),
                      Text(
                        '\$143,98',
                        style: priceTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                // NOTE: DESCRIPTION
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: defaultMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        style: subtitleTextStyle.copyWith(fontWeight: light),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                // NOTE: FAMILIAR SHOES
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    bottom: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Familiar Shoes',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: familiarShoes.map((image) {
                            return familiarShoesCard(image);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget customBottomNav() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 16,
        ),
        color: backgroundColor1,
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/button_chat.png'),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                width: 54,
                height: 54,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    'Add to Cart',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
