import 'package:ecommer_ui/utils/color_constants/color_constatns.dart';
import 'package:ecommer_ui/utils/image_constatns/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstatns.backgroundWhite,
      appBar: AppBar(
        backgroundColor: ColorConstatns.backgroundWhite,
        centerTitle: true,
        title: Text(
          'Detail',
          style: GoogleFonts.sansita(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------------------------------- Product Page --------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  height: 379,
                  width: 350,
                  decoration: BoxDecoration(
                    color: ColorConstatns.productContainer,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: ColorConstatns.mainGrey.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                          color: ColorConstatns.mainBlack.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(5, 2),
                          spreadRadius: 2)
                    ],
                    image: const DecorationImage(
                      image: AssetImage(ImageConstants.tshirtPic),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: ColorConstatns.backgroundWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.favorite_outline),
                  ),
                )
              ],
            ),
          ),

          // ---------------------------------- Product Page ENDS --------------------------------------

          const SizedBox(
            height: 12,
          ),
          // ---------------------------------- Product Main Details --------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Regular Fit Slogan',
                  style: GoogleFonts.sansita(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),

                // ---------------- Rating ------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '4.0 / 5',
                      style: GoogleFonts.sansita(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '(45 reviews)',
                      style: GoogleFonts.sansita(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorConstatns.mainGrey),
                    ),
                  ],
                ),

                // ---------------- Rating ENDS ------------------

                const SizedBox(
                  height: 13,
                ),

                // ---------------- description of Product ----------------

                Text(
                  'The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.',
                  style: GoogleFonts.sansita(
                    fontSize: 16,
                    color: ColorConstatns.mainGrey,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                // ---------------- description of Product ENS ----------------
                const SizedBox(
                  height: 12,
                ),
                // ---------------- Choose size  ----------------
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose size',
                      style: GoogleFonts.sansita(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstatns.backgroundWhite,
                              border: Border.all(
                                  color:
                                      ColorConstatns.mainGrey.withOpacity(0.8)),
                            ),
                            child: Center(
                              child: Text(
                                index == 0
                                    ? "S"
                                    : index == 1
                                        ? "M"
                                        : "L",
                                style: GoogleFonts.sansita(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                // ----------------------- Choose size ENDS  -----------------------
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: ColorConstatns.mainGrey,
        color: ColorConstatns.backgroundWhite,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price',
                    style: GoogleFonts.sansita(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: ColorConstatns.mainGrey,
                    )),
                Text('Rs 1970',
                    style: GoogleFonts.sansita(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorConstatns.mainBlack,
                    )),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: ColorConstatns.mainBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_shopping_cart_rounded,
                      size: 20,
                      color: ColorConstatns.backgroundWhite,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add to Cart',
                      style: GoogleFonts.sansita(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ColorConstatns.backgroundWhite,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
