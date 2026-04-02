import 'package:flutter/material.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/color_manager.dart';
import 'package:project_sadat/ui/add_event/pages/edit_event_page.dart';

class EventDetailsPage extends StatelessWidget {
  static const String routeName = 'event_details';

  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final displayImage = AssetsManager.getThemeAwareAsset(
      context,
      AssetsManager.sport,
      AssetsManager.sport_dark,
    );

    return Scaffold(
      backgroundColor: ColorManager.background(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorManager.textPrimary(context),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Event details',
          style: theme.textTheme.titleMedium?.copyWith(
            color: ColorManager.textPrimary(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditEventPage()),
              );
            },
            icon: Icon(
              Icons.edit_outlined,
              color: ColorManager.primary(context),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline_rounded, color: Colors.red),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              // Main Image (Sport)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  displayImage,
                  height: screenHeight * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              // Event Name
              Text(
                'We\'re going to play football',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: ColorManager.textPrimary(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              // Date & Time Container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorManager.inputFill(context),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: ColorManager.primary(context),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorManager.primary(
                          context,
                        ).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: ColorManager.primary(context),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '21 January',
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: ColorManager.textPrimary(context),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '12:12 PM',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: ColorManager.textSecondary(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Description Title
              Text(
                'Description',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: ColorManager.textPrimary(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              // Description Text
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorManager.inputFill(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis feugiat.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: ColorManager.textPrimary(context),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
