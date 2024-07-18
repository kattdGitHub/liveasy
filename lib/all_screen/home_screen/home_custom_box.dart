part of 'home_screen.dart';

class HomeCustomBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const HomeCustomBox({super.key,  required this.title, required this.imagePath, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
              color: isSelected
                  ? Colors.blue
                  : Colors.transparent, // Highlight selected
            ),
          ),
          Image(image: AssetImage(imagePath))
              .paddingSymmetric(horizontal: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
              ),
              Text(
                'Lorem ipsum dolor sit amet, \nconsectetur adipiscing',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xff6A6C7B),
                ),
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
    );
  }
}
