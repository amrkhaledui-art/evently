import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/core/resources/color_manager.dart';
import 'package:project_sadat/core/reusable/custom_buttom.dart';
import 'package:project_sadat/core/reusable/custom_text_field.dart';
import 'package:project_sadat/ui/add_event/pages/event_details_page.dart';
import 'package:project_sadat/ui/add_event/widgets/event_input_field.dart';

class AddEventPage extends StatefulWidget {
  static const String routeName = 'add_event';

  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  int _selectedCategoryIndex = 0;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<(String, String, String, String)> _categories = [
    (
      'Book Club',
      AssetsManager.bookIcon,
      AssetsManager.bookClub,
      AssetsManager.bookClub_dark,
    ),
    (
      'Sport',
      AssetsManager.sportIcon,
      AssetsManager.sport,
      AssetsManager.sport_dark,
    ),
    (
      'Birthday',
      AssetsManager.birthdayIcon,
      AssetsManager.birthday,
      AssetsManager.birthday_dark,
    ),
    (
      'Meeting',
      AssetsManager.meetingIcon,
      AssetsManager.meeting,
      AssetsManager.meeting_dark,
    ),
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;
    final currentCategory = _categories[_selectedCategoryIndex];
    final displayImage = isDark ? currentCategory.$4 : currentCategory.$3;

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
          'Add event',
          style: theme.textTheme.titleMedium?.copyWith(
            color: ColorManager.textPrimary(context),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              // Main Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  displayImage,
                  height: screenHeight * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Categories
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final selected = index == _selectedCategoryIndex;
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _selectedCategoryIndex = index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: selected
                              ? ColorManager.primary(context)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: ColorManager.primary(context),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              _categories[index].$2,
                              colorFilter: ColorFilter.mode(
                                selected
                                    ? Colors.white
                                    : ColorManager.primary(context),
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _categories[index].$1,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: selected
                                    ? Colors.white
                                    : ColorManager.primary(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Title Input
              Text(
                'Title',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: ColorManager.textPrimary(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _titleController,
                hintText: 'Event Title',
                borderRadius: 12,
              ),
              const SizedBox(height: 16),
              // Description Input
              Text(
                'Description',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: ColorManager.textPrimary(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _descriptionController,
                maxLines: 4,
                hintText: 'Event Description...',
                borderRadius: 12,
              ),
              const SizedBox(height: 24),
              // Selectors
              EventInputField(
                icon: Icons.calendar_today_outlined,
                text: 'Event Date',
                actionText: 'Choose date',
                onActionTap: () {},
              ),
              EventInputField(
                icon: Icons.access_time_rounded,
                text: 'Event Time',
                actionText: 'Choose time',
                onActionTap: () {},
              ),
              const SizedBox(height: 32),
              // Submit Button
              CustomButton(
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventDetailsPage(),
                    ),
                  );
                },
                title: 'Add event',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
