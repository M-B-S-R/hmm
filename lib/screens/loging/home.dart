
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hmm/appcolor/app_colors.dart';
import 'package:hmm/data/home-page-data.dart';
import 'package:hmm/detailscreen/detail_screen.dart';
import 'package:hmm/models/SingleProductModel.dart';
import 'package:hmm/routes/routes.dart';
import 'package:hmm/styles/home_screen_stylies.dart';
import 'package:hmm/svgimages/svg_images.dart';
import 'package:hmm/tabbar/tabbar_data.dart';
import 'package:hmm/widgets/show_all_widget.dart';
import 'package:hmm/widgets/singleProduct_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  SingleProductModel? get signleProductModel => null;

  // static SingleProductModel signleProductModel;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      bottom: const TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 22),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text("All"),
          Text("Clothing"),
          Text("Shoes"),
          Text("Accesories"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: const [
          Text(
            "Welcome",
            style: HomeScreenStylies.appBarUpperTitleStylies,
          ),
          Text(
            "Shopping",
            style: HomeScreenStylies.appBarBottomTitleStylies,
          )
        ],
      ),
      actions: [
        // IconButton(
        //   icon: RotationTransition(
        //     turns: AlwaysStoppedAnimation(90 / 360),
        //     child: SvgPicture.asset(
        //       SvgImages.filter,
        //       color: AppColors.baseBlackColor,
        //       width: 30,
        //     ),
        //   ),
        //   onPressed: () {
        //     PageRouting.goToNextPage(
        //       context: context,
        //       navigateTo: FilterScreen(),
        //     );
        //   },
        // ),
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildAdvertismentPlace() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 170,
        child: Carousel(
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: const Duration(microseconds: 1000),
          showIndicator: false,
          images: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "data:image/jpeg;base64,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"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAIMA0gMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAAAQIDBAUGB//EADwQAAEDAwIDBQUFBgcBAAAAAAEAAgMEESESMQVBURMiYXGBBhQykaEVI0JU0TOSscHh8DRDRFJTYoIH/8QAGQEAAwEBAQAAAAAAAAAAAAAAAAIDAQQF/8QAKREAAgIBAgUEAgMBAAAAAAAAAAECEQMSIQQTFDFBBRVRYSJSQnGhMv/aAAwDAQACEQMRAD8A8f0yx91wKfECx4fbZXX9hUfs2lh6a7hU33jdYEkDcWVkXlBQdp2iQRsdJf4WnOeSm0sjGnW4je42VeN7Xna4PK6la+12lpttlDQ0Gh4iZLgaT9FBNRPZ3mbXwLp7AQ/ujS7qrBnkaNM0TSOpWU0NUJLczw119LzlTNFozGWgi9wpJWMLS4D0BUYBAyE5LTpZNCyG5u46hs0BR1I1gO57EKWnhfJdzWkkJz3i4a6O7uRGEtFKuO5msBDhjnhaMlO4RMmBw7fwKZJGLBwIPkgTyBpjHwu3Hj1WiRjpvURazK7Ta3grVGN2uwDcJIqcxMEzx3Qc4VmliY+eNmoaSe8UPsUxwepWVXxdk8OANg5V5NOu7bgLWrIDG97Ac3yOizJI7s1DqhOwy43GTQrRrYR0VeQXsrMIs7OyHxgsv4rSTjaKbd8KZ7bNF90wD7wBPlOU6JJbEYTLbqbTYXTCECsZFHqycWT33JsBhWImRhl5D5KF3edYXtysg2izQxiICU7BwdjfCrVUjpCLcyTdPLi0mMH8Nkj4zhoGUrKXcdKIezQl7CVKlsWvojbqYbbeSeHG41EkBOFnCzhnqpWMBjcCe8Ns7raNSvsI1gdkNv4WTowYze1xzCWGQR3xuLKaMdq4ADvFYWik/wCxY2axcbKWVn3YO5SM+6ukbaRwasLpJKn3I30rrXaQQeilijaGDWMqaENaDqNiDi5U80bHRBzPkstjxwruQxuLWhsW+zrKVtAJCNZG2CiFv3ZB3PROJl0uZkZuD0RdlFFVcilJD2Mtramk5xexU0FG2RwLj9FdpoGPIfKRpvdwTaltqh5PwYAt0thGrwHIpaqKks+pwhAOkXBscEqf3U0kMcosXyO7lv8AbzKhnZ2T2kWI3wFoUeuoaYnZt3o7ha3sZCFycX38FfsC+EOJHiVThaHzhrx3Sf5Fa3u3ZRvaXFo5A8wqslOA0yRE2byslTKZcXYzpKcsc6wJZfdO0N7E9VaqCHtBYNHVp6qMx2IJsA4YTpnNKCUnRlWtIT0TCNb/AFV2oia0lo5p0NHaifUHcOAHkU9o5OVJypFSXlbko7Kdzc5CSWIssXc9lpOUWV7m+6kiwSR/eU3R3reKkawg2tvugVAxp7QuB5nJTrO0agdsEqaBgkkcLjS0ZztdRyyaGuYLaT/FJJ+DojFadRUMj7/GUJh3QlolqQ5twpdwmtLObSnhpd8JCpRiEsLqaJzmPBte2RdRhpblzTZW4NDgAcSN2PIjohlYLcV7r3uLeKiY8seHDNlfprOD+1y0ZLTa9s3soZ6QZkprujvaxOUheUW0pIWP7x2+d1YiswElx3zzVBr+YBFuasMfcsyD1scrHEpjyI1Yoo5Ie0YfhBv5plGGTMeTlzRsU6B7Yv2f1N8KqTpneBcAn4gNkiTO2U4qmWvdZoXAtvpcNnKeKNkgaxx7x28UjaqOGJo7QvO1z/FNipjORNE5o0nvW5eKV/ZaOlP8Nxs7HCSNhaNThgFLKx8bgYjfu5BH8E/iUV2skc0gtd3iOfirlKZ5nBwEZjLdJcd7o1fjZvLTm4lRzveKd+tumQNsT5EKOjnaaZzZu5mxcRcb7rUlgjc1pYbFwNmBZdLSuZXaZBHpvfTId0QaaYuWEoTj97FfibGjLbEHYjn0VZ+nuDLgeQWrxOBzcuFncgNrLKZFdwu0lNGWxzZ8bU3RWnHdOLW2WzWxMj4LT6fxNv57qrVQtcxlmeebq5MTLwiBobYMOlGR3VG4MenmJ/BiR0/auIvyufJQ1ThI/u30gWF1oVMRZEWtaQSM+IWa2M6rFXi7PNyRcdhscZAuguezbcqyRpaAo3SBmwz1WOQvKpDy5kUOsNsXDNjlZshubqd1z5KJzeaEvImSV7IhyhSIQRodoS6Sp+xKUQlNZbQRtcQADkKVju9cYS9iU4QrUakx12kZvfqCkinkjfvdt8jqnCIp3YlGw+/gJXNkdfl5WUTWFrrgqcQOTuxd0QqRjtuxrat47uMc1Y7Vjm3DrdQVD7v4I7IjYIpDqcl3FqWuADtr72Ks8OrZISbE45cyoi5mkNe5rbC/ecFRlr6Zj7teHHqxmEr0tbmrK4S1JnY0/Z17OxnjMchuRbY9FRqphRtMQiDXA4cP59VjRe00cMWmOGQv5m9sKvUccjkkI7OUtG2B+qhFRT+juyccpQ27m/DXU88RbNpjlGdZvk/3hJQVkRqh71HqHM3/AIrnhxOn1fjtyxurcU9PI9rxKLHIAdZU0w8HP1k5NX4OvDKZ8MjY362tznoqzuFsnpw+jkaHt/yyBlZMtU98YjZ3GDkko55qedry5z2jdpKjyWt0zv6yMmk47DnQywylsjdBPxAqzESKa0n7Nrr28lrNEFfEDGe+N9W5VbizBS0QbGD3jZ2On0SPIm90dMcFRcovYyap7ZIdQbYg5PgsmWzRcdbrVrm6I2xtsHX1Oxv4LLnBsAQQSqqfwefnxb2+5BrLjhBbjIVunhjYwvk6YCaI3yXIZYLFLcm8L0plMi+AmOZ1VuRoaOV1XNin1M5pY6ItAQpNPgUiwXSjZbSX5fROFH4LVEATxE3op8w9BcPZke5JRR+H0WyIQU5sARzWN0qMcUZ6fRSNo/D6LYEAUjKcLOcMuERjCiPT6JwoT0PyW/HTA8lMKRvgl54/SI5LiLWUNM+eUHSMAbXK5er4lNU4aOzjHJp3810vtzP34+GwxymTEjrDukcvNc5T0/aObHSxOlkabnVax8FRTbR5HEtRyOMSk6+NWrwukDb+HgtSLs36o5YGsbezngfCRuMeuFZ+yw83YcYAIyDcgWPIbpJSJwx6mY4gOHZSmA87rpaXhIdE6QC7W7964zsp6zhLCZXgh7Yxclgtf0uMXxhQ5qs7uilps49zNBOo2t4bpG4yLre+y9TnYvpINgb4zkkY5KrWCOnL2QgPJb3ndP5eSvF2cWTHpKdLXVFLJ2sb72OQ/I9Qup4LWN4pG+7AyRnxAG65t0ZDGzTRtMLm40kA55lWPZ6qFDxVg0yOZNZo0b5ODZNZuDI4TSfY62KF8TwY73B/DyWhH2crL1bQ+xtoLfqrYprMu0E9T1VuHhcfZdvO4kb28FCc4tfke7iU4OoHM8Xp4XOL2M1+Nlz7IJZLvijswHc7LuquejjbojhBJxYBZVWxziGtjLW72wAP1UVnS2R3z4J5Fqns/owWB1/vDfGBZPkbI5nMDoMBXxQPkdctNr9VZj4RrA7ST0PJVWQ5JcP4ObfCCRrcLdUjgxgsBddZ9j0cQu+Rt1UqoKSIHRn1TrMmcs+EaVnM6v8Aqhapkgv/AEQqazl5RuCycBdcH9rcQ/OSfT9Eo4tX/nJfp+iOU/kI+oR+DvgAE5tlwQ4rxD83L9E4cUr/AM3Is5THXqEfg79lrqxGF523ilfyrJB6qRvFOI3/AMbN81nIb8jr1CP6npUbLp0gLRZedN4nxL89P+8po6/iLt6yU+b0r4aS8lI8dF+DtnUkFRIJJoY3vA0hzmgkBcvV+x0xqXv95a6N7i5xLLEZxYDHXKbDVV52q5P3laZLXEDVWS+HfKFjnHyE4Ys3dFSP2QqhGe/E8Mjs1oOm7uV8ZF+qoQ8NradrO0ppWxudgnLXnHpldHFNVt/1Mv75VyCedzm65Xvsbi5vYpZqVD4+DgnaND2R4dHVTU0NTH2QLSA4jB/rutb2t4FTcMlhhoB2z7Xaw2ucHfkqTa2WKildrJ0ROIB5Y5KDgfF6qt4LDUSzOdJJqLnX3s4gfQLgcZJs6eVN5VT2+DiKjhtdV1MkdNSyyEghzY8Ntc4J9dlNS+w/E3gPlMEGfgvqPry8t11s9TVjIncPVUJa7iDfgqSF1w11sSy8FGTtsxov/ndUe6+raA5x16WcuVlr8J9iqbhFQJy5807RZrn7NPUKs7ifFRtWvHlZVZuK8Xvc1jz8k+jNLyRjgwYnek673cgHxTtTomWe67Lc8rgpOM8XH+tk+ipzcX4o+4fWSfRHS5Gu5r4vHGV0zvpJomDutb0vcBUpJuQcQOgcFwr+I19/8U76KJ3Ea471T7+iToci8l/d8S/izuu443fI7y1/0QDTNOb381wf2lWjapePQKM8TredS/0AR0k/kX3jD+r/AMO+kfS9XH1VGpdS8oW+q4t3EKw71MhUZrKk7zuKaPCSXklP1jG/4s6y8H/Gz5hC5H3mf/lf9EKnTy+Tm9zx/qRBOFk26W67Dx0yQJwIUQKcEDJkzSpGkX3VcG29rJRMwf5g+aLGUi61w6qxE7ODZZfvUQ3kHyT210A3df8A8rbQ6yUb0EtsC5+f6K7FMLYezyuP1XOR8TpgMuOPApzuNxNF2mV1tgSSPqpujqhxFd2dQ2XG6BXxwvu9zWjxK4ybj1W8ERuEYPRUJJ5JHF8j3OJ3JKjKNlvcFH/lHodR7SULad7PeGl5aRYZ5Kn7L8dpKThUVNUzhjmasE23cT/NcOH480utS5SqjPcZ61OkeoM4xQ1JIhqGOI3sQoZ5QT3SLdQQV5mZDe4OVZg4nWQ2bHO4tH4XG4TxjQ79T1KmjtXzj/cPmqs83Qj0wsBnHHEffxlx/wCpslPGIXfgePEj+q6FRzz4pPszQlfe9yVVe8dQqj+JQu2JH/lRmthP4nfJPaOaWSyy9wUbnBQe8xH8aO0a7ZzUWiblZISmGyT1CaSgWxXWTEpTboFbCyEakIMECW4AyVWLymkk7lJrAsGdrfhF0x07/AeSiQktgKXOO7iUiELABCEIAAnJqUFBqYqEXQgYCgIKS6wBUJLoJWmWKmouhBjYIQhBgIQhADmyPb8Lj6qRs5/ELqFC22BaD2nYpDlVkoc4c02sCwhQayhbzEA1CEKYAhCEACEIQAIQhAAhCEAATkIQMgKTkhCDWIhCECAhCEACEIQAIQhAAhCEACEIQAIQhAH/2Q==",
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrendingProduct({
    required String productImage,
    required String productName,
    required String productModel,
    required double productPrice,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
      height: 65,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(productImage),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  overflow: TextOverflow.ellipsis,
                  style: HomeScreenStylies.trendingProductNameStyle,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  productModel,
                  style: HomeScreenStylies.trendingProductModelStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: MaterialButton(
              color: AppColors.baseLightPinkColor,
              elevation: 0,
              height: 45,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(0.7),
              ),
              onPressed: () {},
              child: Text(
                "\$ $productPrice",
                style: HomeScreenStylies.trendingProductPriceStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                buildAdvertismentPlace(),
                ShowAllWidget(
                  leftText: "New Arrival",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: sigleProductData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      var arrivalDataStore = sigleProductData[index];

                      return SingleProductWidget(
                        productImage: arrivalDataStore.productImage,
                        productModel: arrivalDataStore.productModel,
                        productName: arrivalDataStore.productName,
                        productOldPrice: arrivalDataStore.productOldPrice,
                        productPrice: arrivalDataStore.productPrice,
                        onPressed: () {
                          PageRouting.goToNextPage(
                            context: context,
                            navigateTo: DetailScreen(
                              data: arrivalDataStore,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                ShowAllWidget(
                  leftText: "What's trending",
                ),
                buildTrendingProduct(
                  productImage:
                  'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                buildTrendingProduct(
                  productImage:
                  'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                buildTrendingProduct(
                  productImage:
                  'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                ShowAllWidget(
                  leftText: "Your History",
                ),
                SizedBox(
                  height: 260,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    itemCount: shoesData.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      var historyDataStore = shoesData[index];

                      return SingleProductWidget(
                          onPressed: () {
                            PageRouting.goToNextPage(
                              context: context,
                              navigateTo: DetailScreen(
                                data: historyDataStore,
                              ),
                            );
                          },
                          productImage: historyDataStore.productImage,
                          productModel: historyDataStore.productModel,
                          productName: historyDataStore.productName,
                          productOldPrice: historyDataStore.productOldPrice,
                          productPrice: historyDataStore.productPrice);
                    },
                  ),
                ),
              ],
            ),
            TabBarBar(
              productData: colothsData, categoryProductData: [],
            ),
            TabBarBar(
              productData: shoesData, categoryProductData: [],
            ),
            TabBarBar(
              productData: accessoriesData, categoryProductData: [],
            ),
          ],
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SingleProductModel>('singleProductModel', signleProductModel));
    properties.add(DiagnosticsProperty<SingleProductModel>('singleProductModel', signleProductModel));
  }
}
