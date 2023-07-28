import 'package:clothing/screens/app/widgets/element_title.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'category_toggle.dart';
import '../../auth/widgets/submit_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late RangeValues _pricingRangeValues;
  late RangeValues _distanceRangeValues;
  String pricingStart = '\$50';
  String pricingEnd = '\$200';
  String distanceStart = '500m';
  String distanceEnd = '2Km';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pricingRangeValues = const RangeValues(50, 200);
    _distanceRangeValues = const RangeValues(500, 2000);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showFilterBottomSheet();
      },
      child: Container(
        margin:
            const EdgeInsetsDirectional.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(ColorManager.mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 43,
        width: 47,
        child: Image.asset(
          ImageManager.filterImage,
          cacheHeight: 13,
          cacheWidth: 15,
        ),
      ),
    );
  }

  void _showFilterBottomSheet() async {
    String? result = await showModalBottomSheet(
      isScrollControlled: true,
      // constraints: BoxConstraints.expand(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      isDismissible: true,
      context: context,
      builder: (context) {
        return BottomSheet(
          backgroundColor: Colors.transparent,
          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 18, left: 18, top: 20, bottom: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Text(
                            'Filters',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.zero,
                              // margin: const EdgeInsetsDirectional.only(end: 12, top: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12,
                              ),
                              height: 30,
                              width: 30,
                              child: IconButton(
                                  style: IconButton.styleFrom(
                                    visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity),
                                  ),
                                  splashColor: Colors.transparent,
                                  enableFeedback: false,
                                  padding: EdgeInsets.zero,
                                  onPressed: () =>
                                      setState(() => Navigator.pop(context)),
                                  icon: const Icon(
                                    Icons.close,
                                    size: 18,
                                  ))),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 0,
                    ),
                    const Padding(
                      padding:  EdgeInsets.all(18),
                      child:  ElementTitle(title:'Category'),
                    ),
                    const CategoryToggle(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ElementTitle(title:'Pricing'),
                          Text(
                            '$pricingStart-$pricingEnd',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RangeSlider(
                      activeColor: const Color(ColorManager.mainColor),
                      inactiveColor: Colors.black12,
                      min: 0,
                      max: 350,
                      labels: RangeLabels(
                        '\$${_pricingRangeValues.start.toInt().toString()}',
                        '\$${_pricingRangeValues.end.toInt().toString()}',
                      ),
                      divisions: 7,
                      values: _pricingRangeValues,
                      onChanged: (RangeValues value) {
                        setState(() {
                          _pricingRangeValues = value;
                          pricingStart =
                              '\$${_pricingRangeValues.start.toInt().toString()}';
                          pricingEnd =
                              '\$${_pricingRangeValues.end.toInt().toString()}';
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ElementTitle(title:'Distance'),
                          Text(
                            '$distanceStart-$distanceEnd',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RangeSlider(
                      activeColor: const Color(ColorManager.mainColor),
                      inactiveColor: Colors.black12,
                      min: 0,
                      max: 3500,
                      labels: RangeLabels(
                        '${_distanceRangeValues.start.toInt().toString()}m',
                        '${_distanceRangeValues.end.toInt().toString()}m',
                      ),
                      divisions: 7,
                      values: _distanceRangeValues,
                      onChanged: (RangeValues value) {
                        setState(() {
                          _distanceRangeValues = value;
                          distanceStart =
                              '${_distanceRangeValues.start.toInt().toString()}m';
                          distanceEnd =
                              '${_distanceRangeValues.end.toInt().toString()}m';
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Center(
                        child: SubmitButton(
                          text: 'Apply Filter',
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}


