import 'package:ecommer_ui/controller/home_screen_controller/home_screen_controller.dart';
import 'package:ecommer_ui/utils/color_constants/color_constatns.dart';
import 'package:ecommer_ui/utils/image_constatns/image_constants.dart';
import 'package:ecommer_ui/view/product_page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => context.read<HomeScreenController>().getCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeScreenController>(context);

    return Scaffold(
      backgroundColor: ColorConstatns.backgroundWhite,
      body: Column(
        children: [
          //----------------------------- Discover Heading Section -----------------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover',
                  style: GoogleFonts.sansita(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    Icons.notifications_outlined,
                    size: 30,
                  ),
                )
              ],
            ),
          ),

          //----------------------------- Discover Heading Section Ends -----------------------------------------

          const SizedBox(
            height: 16,
          ),

          //----------------------------- Search Bar and Sorts  ---------------------------------------------------

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: ColorConstatns.mainGrey,
                      ),
                      suffixIcon: const Icon(
                        Icons.mic_none_outlined,
                        size: 26,
                        color: ColorConstatns.mainGrey,
                      ),
                      hintText: 'Search for Clothes...',
                      hintStyle: const TextStyle(
                        color: ColorConstatns.mainGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: ColorConstatns.mainBlack,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Image(
                    image: AssetImage(ImageConstants.sortIcon),
                  ),
                )
              ],
            ),
          ),
          //----------------------------- Search Bar and Sorts Ends ------------------------------------------------

          const SizedBox(
            height: 16,
          ),

          //-----------------------------Horizontal  Categories ------------------------------------------------------------------

          if (homeController.productCategory.isEmpty)
            const Text('categories is empty'),
          if (homeController.productCategory.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, categoryIndex) => InkWell(
                    onTap: () {
                      homeController.selectedCategoryIndex = categoryIndex;
                      homeController.categoryTapFunction(categoryIndex);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: categoryIndex == 4 ? 20 : 0),
                      child: Container(
                        height: 45,
                        width: categoryIndex == 0 ? 70 : 130,
                        decoration: BoxDecoration(
                            color: homeController.selectedCategoryIndex ==
                                    categoryIndex
                                ? ColorConstatns.mainBlack
                                : ColorConstatns.backgroundWhite,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: ColorConstatns.mainGrey,
                            )),
                        child: Center(
                          child: Text(
                            categoryIndex == 0
                                ? "All"
                                : homeController
                                    .productCategory[categoryIndex - 1],
                            style: GoogleFonts.sansita(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: homeController.selectedCategoryIndex ==
                                      categoryIndex
                                  ? ColorConstatns.backgroundWhite
                                  : ColorConstatns.mainBlack,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: homeController.productCategory.length + 1,
                ),
              ),
            ),

          //----------------------------- Horizontal Categories Ends ------------------------------------------------------------------

          //----------------------------- List of the Products ------------------------------------------------------------------

          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7),
              itemCount: 20,
              itemBuilder: (context, productIndex) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(),
                      ));
                },
                child: SizedBox(
                  height: 235,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 174,
                            width: 164,
                            decoration: BoxDecoration(
                              color: ColorConstatns.productContainer,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ColorConstatns.mainBlack.withOpacity(0.2),
                                  blurRadius: 2,
                                  offset: Offset(1, 4),
                                )
                              ],
                              image: const DecorationImage(
                                image: AssetImage(ImageConstants.tshirtPic),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: InkWell(
                              onTap: () {
                                homeController.selectedProductIndex =
                                    productIndex;
                                homeController.productTapFunction(productIndex);
                                print(productIndex);
                              },
                              child: Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                  color: ColorConstatns.backgroundWhite
                                      .withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: homeController.selectedProductIndex ==
                                        productIndex
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(Icons.favorite_outline),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Regular Fit Slogan",
                        style: GoogleFonts.sansita(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Rs 1290",
                        style: GoogleFonts.sansita(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorConstatns.mainGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),

          //----------------------------- List of the Products Ends ------------------------------------------------------------------

          // ------------------------- bottom navigation Bar -------------------------------------------------------------
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: ColorConstatns.mainBlack,
              ),
              label: 'Home',
              backgroundColor: ColorConstatns.backgroundWhite),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined,
                color: ColorConstatns.unselectedBottomNavigationIcon),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline,
                color: ColorConstatns.unselectedBottomNavigationIcon),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,
                color: ColorConstatns.unselectedBottomNavigationIcon),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,
                color: ColorConstatns.unselectedBottomNavigationIcon),
            label: 'Profile',
          ),
        ],
        backgroundColor: ColorConstatns.unselectedBottomNavigationIcon,
        fixedColor: ColorConstatns.backgroundWhite,
        currentIndex: 0,
        iconSize: 25,
      ),
    );
  }
}
