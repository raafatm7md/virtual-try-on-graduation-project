import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImagesSlider extends StatelessWidget {
  const ProductImagesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: CarouselSlider(
        items: [
          'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_01_01.jpg',
          'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_02_01.jpg',
          'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_03_01.jpg',
          'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_04_01.jpg',
          'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_05_01.jpg',
          'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_06_01.jpg',
        ]
            .map((image) => CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ))
            .toList(),
        options: CarouselOptions(
            height: 250.0,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal),
      ),
    );
  }
}
