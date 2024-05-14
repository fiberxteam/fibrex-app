import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomOffersCard extends StatefulWidget {
  const CustomOffersCard({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<CustomOffersCard> createState() => _CustomOffersCardState();
}

class _CustomOffersCardState extends State<CustomOffersCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(horizontal: Insets.small),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Insets.medium),
                ),
                child: Image.asset(
                  widget.images[index],
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),
        SizedBox(height: Insets.small + 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) => AnimatedContainer(
              duration: Durations.long1,
              margin: EdgeInsets.symmetric(horizontal: Insets.small / 2),
              width: index == currentIndex ? Insets.exLarge : 8,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.small),
                boxShadow: index == currentIndex
                    ? [
                        BoxShadow(
                          color: context.theme.colorScheme.primary
                              .withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ]
                    : [],
                color: index == currentIndex
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.outline.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  int currentIndex = 0;
}
