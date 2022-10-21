import 'package:drugs/utils/images.dart';

class OnboardingModel {
  String imageName;
  String title;
  String content;
  int postIndex = 0;

  OnboardingModel({
    required this.imageName,
    required this.title,
    required this.content,
  });

  static List<OnboardingModel> onboard = [
    OnboardingModel(
      imageName: MyImages.image_splash1,
      title: '''   View and buy 
Medicine online''',
      content: '''     Etiam mollis metus non purus
faucibus sollicitudin. Pellentesque
               sagittis mi. Integer.''',
    ),
    OnboardingModel(
      imageName: MyImages.image_splash2,
      title: '''Online medical &
      Healthcare''',
      content: '''     Etiam mollis metus non purus
faucibus sollicitudin. Pellentesque
               sagittis mi. Integer.''',
    ),
    OnboardingModel(
      imageName: MyImages.image_splash3,
      title: 'Get Delivery on time',
      content: '''     Etiam mollis metus non purus
faucibus sollicitudin. Pellentesque
               sagittis mi. Integer.''',
    ),
  ];
}
