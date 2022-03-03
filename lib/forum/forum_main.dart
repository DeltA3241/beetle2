import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/forum_card.dart';

class ForumMain extends StatefulWidget {
  const ForumMain({Key? key}) : super(key: key);

  @override
  State<ForumMain> createState() => _ForumMainState();
}

class _ForumMainState extends State<ForumMain> {
  double height = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: kpaddingSearchBar,
          child: SearchBar(label: 'Search Post / پوسٹ تلاش کریں'),
        ),
        Expanded(
          child: ListView(
            children: const [
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
              ForumCard(
                title: 'Title/عنوان',
                description:
                    'Description ikjegfLIGflegsiufkg  seiufghilesUGF iesghfIUegsfigfeSIUgu eufghiuesfgh/تم ایک کتیا گدی کے بیٹے بھاڑ میں جاؤ، اپنی ماں کو بھاڑ میں جاؤ',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
