part of 'shared.dart';

class CustomCard extends StatefulWidget {
  final String? title;
  final String? startDate;
  final String? endDate;
  final String? status;
  final bool? isCompleted;
  final void Function(bool val)? onValueChanged;

  const CustomCard({
    super.key,
    this.title,
    this.startDate,
    this.endDate,
    this.status,
    this.isCompleted = false,
    this.onValueChanged,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text(
                  widget.title!,
                  style: CustomTextStyles.bodyText5TextStyle,
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date',
                            style: CustomTextStyles.subtitle,
                          ),
                          Text(
                            widget.startDate!,
                            style: CustomTextStyles.bodyText6TextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End Date',
                            style: CustomTextStyles.subtitle,
                          ),
                          Text(
                            widget.endDate!,
                            style: CustomTextStyles.bodyText6TextStyle,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time Left',
                            style: CustomTextStyles.subtitle,
                          ),
                          Text(
                            '23 hrs 22 min',
                            style: CustomTextStyles.bodyText6TextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10.0)),
              child: Container(
                height: 30,
                color: AppColors.card,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Status',
                            style: CustomTextStyles.subtitle,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            widget.status!,
                            style: CustomTextStyles.bodyText6TextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Tick if completed',
                            style: CustomTextStyles.subtitle,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Transform.scale(
                            scale: 0.9,
                            child: Container(
                              width: 14,
                              height: 14,
                              color: AppColors.white,
                              child: Checkbox(
                                checkColor: AppColors.black,
                                activeColor: AppColors.primary,
                                value: widget.isCompleted,
                                onChanged: (val) {
                                  widget.onValueChanged!(val!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
