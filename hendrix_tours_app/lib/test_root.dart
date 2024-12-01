

import 'objects/info_view_item.dart';
import 'objects/list_view_item.dart';

ListViewItem testRoot = ListViewItem(
  title: 'Big Tester',
  child: [secondTest, thirdTest, babyTest],
  hasImage: false,
  videoPath: 'https://drive.google.com/uc?export=download&id=1QpEP4rnBEqwu-zaHSSwVfrU-hInBe5DG',
  isListView: true,
  link: 'https://www.boredbutton.com/random',
);

ListViewItem secondTest = ListViewItem(
  title: 'Second Tester',
  child: [thirdTest, babyTest],
  hasImage: true,
  imagePath: 'lib/assets/academics.jpg',
  isListView: true,
  link: 'https://www.hendrix.edu',
);

ListViewItem thirdTest = ListViewItem(
  title: 'Third Tester',
  child: [babyTest],
  hasImage: false,
  isListView: true,
  link: '',
);

InfoViewItem babyTest = InfoViewItem(
  title: 'Baby Tester',
  description: 'Big Baby Tester Moment',
  hasImage: true,
  imagePath: 'lib/assets/athletics.jpg',
  connBuildings: [smallBabyTest, smallestBabyTest],
  connDepartments: [smallestBabyTest, smallBabyTest],
  link: 'https://www.boredbutton.com/random',
);

InfoViewItem smallBabyTest = InfoViewItem(
  title: 'Small Baby Tester',
  description: 'Small Baby Tester Moment',
  hasImage: true,
  imagePath: 'lib/assets/athletics.jpg',
  connBuildings: [smallestBabyTest],
  connDepartments: [],
  link: 'https://www.boredbutton.com/random',
);

InfoViewItem smallestBabyTest = InfoViewItem(
  title: 'Smallest Baby Tester',
  description: 'Smallest Baby Tester Moment',
  hasImage: true,
  imagePath: 'lib/assets/athletics.jpg',
  connBuildings: [],
  connDepartments: [],
  link: 'https://www.boredbutton.com/random',
);