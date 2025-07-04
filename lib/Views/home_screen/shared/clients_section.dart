import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mucs/Data/blocs/homescreen/homepage/bloc/homescreen_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ClientsSection extends StatelessWidget {
  const ClientsSection({super.key});

  static const Map<String, IconData> iconMap = {
    'business': Icons.business,
    'rocket_launch': Icons.rocket_launch,
    'gavel': Icons.gavel,
    'trending_up': Icons.trending_up,
    'account_balance': Icons.account_balance,
    'people': Icons.people,
  };

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onPrimary;
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<HomescreenBloc, HomescreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeScreenLoadingState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        if (state is HomeScreenSucessState) {
          final List<Map<String, dynamic>> clients = state.data['clients'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Our Clients',
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

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: clients.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.5,
                    ),
                    itemBuilder: (context, index) {
                      final client = clients[index];
                      final iconName = client['icon']?.toString() ?? '';
                      final icon = iconMap[iconName] ?? Icons.business_center;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon, color: color, size: 28),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                client['name'] ?? '',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
