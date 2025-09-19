import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class BestSellerListViewLoadingIndicator extends StatelessWidget {
  const BestSellerListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CustomFadingWidget(
            child: SizedBox(
              height: 170,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width * .5,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 16,
                          width: 100,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 60,
                              color: Colors.grey[300],
                            ),
                            const Spacer(),
                            Container(
                              height: 16,
                              width: 80,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}