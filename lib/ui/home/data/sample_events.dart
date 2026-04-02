import 'package:project_sadat/core/resources/AssetsManager.dart';
import 'package:project_sadat/ui/home/widgets/event_card.dart';

List<EventItemData> sampleEvents() {
  return [
    const EventItemData(
      title: 'Birthday Party',
      description: 'This is a Birthday Party',
      dateDay: '21',
      dateMonth: 'Jan',
      imageAsset: AssetsManager.birthday,
      imageAssetDark: AssetsManager.birthday_dark,
    ),
    const EventItemData(
      title: 'Book Club Meeting',
      description: 'Monthly book club discussion',
      dateDay: '22',
      dateMonth: 'Jan',
      imageAsset: AssetsManager.bookClub,
      imageAssetDark: AssetsManager.bookClub_dark,
    ),
    const EventItemData(
      title: 'Update Development Method',
      description: 'Meeting for Updating The Development Method',
      dateDay: '23',
      dateMonth: 'Jan',
      imageAsset: AssetsManager.meeting,
      imageAssetDark: AssetsManager.meeting_dark,
    ),
    const EventItemData(
      title: 'Sports Day',
      description: 'Annual sports day activities',
      dateDay: '24',
      dateMonth: 'Jan',
      imageAsset: AssetsManager.sport,
      imageAssetDark: AssetsManager.sport_dark,
    ),
  ];
}
