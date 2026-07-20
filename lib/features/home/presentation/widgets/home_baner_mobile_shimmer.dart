import 'package:dmpportfolioapp/shared/common/stranded_shimmer.dart';
import 'package:flutter/material.dart';

class MobileHomeBannerShimmer extends StatelessWidget {
  const MobileHomeBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                StrandedShimmer(height: 18, width: 150),
                SizedBox(height: 8),
                StrandedShimmer(height: 18, width: 120),
                SizedBox(height: 16),
                StrandedShimmer(height: 70, width: 120, borderRadius: 12),
              ],
            ),
          ),
          SizedBox(width: 12),
          StrandedShimmer(height: 90, width: 90, borderRadius: 45),
        ],
      ),
    );
  }
}
