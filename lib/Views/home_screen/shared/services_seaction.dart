import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mucs/Data/blocs/homescreen/homepage/bloc/homescreen_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const Map<String, IconData> iconMap = {
    'business_center': Icons.business_center,
    'rocket_launch': Icons.rocket_launch,
    'house': Icons.house,
    'trending_up': Icons.trending_up,
    'language': Icons.language,
    'receipt_long': Icons.receipt_long,
    'verified': Icons.verified,
    'factory': Icons.factory,
    'account_balance': Icons.account_balance,
    'key': Icons.key,
    'group': Icons.group,
    'account_balance_wallet': Icons.account_balance_wallet,
    'search': Icons.search,
    'account_tree': Icons.account_tree,
    'attach_money': Icons.attach_money,
  };

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onPrimary;
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<HomescreenBloc, HomescreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Our Services',
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount =
                    constraints.maxWidth > 1000
                        ? 4
                        : constraints.maxWidth > 600
                        ? 3
                        : 2;

                if (state is HomeScreenLoadingState) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[600]!,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      );
                    },
                  );
                }

                if (state is HomeScreenSucessState) {
                  final List<Map<String, dynamic>> services =
                      state.data['services'];

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: services.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.3,
                    ),
                    itemBuilder: (context, index) {
                      final service = services[index];
                      final iconKey = service['icon']?.toString() ?? '';
                      final icon = iconMap[iconKey] ?? Icons.help_outline;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon, color: color, size: 36),
                            const SizedBox(height: 12),
                            Text(
                              service['title'] ?? '',
                              textAlign: TextAlign.center,
                              style: textTheme.bodyLarge?.copyWith(
                                color: color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        );
      },
    );
  }
}
