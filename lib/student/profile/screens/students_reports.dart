import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/services/reports_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/constants.dart';

class ViewReports extends StatefulWidget {
  dynamic stdModel;

  ViewReports({super.key, required this.stdModel});


  @override
  State<ViewReports> createState() => _ViewReportsState();
}

class _ViewReportsState extends State<ViewReports> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder(
            future: fetchAllReports(widget.stdModel.id),
            builder: (context, snapshot) {
              Widget customDailog(BuildContext context,ReportModel report) {
                return Center(
                  child: Container(
                    width: 332.w,
                    height: 453.h,
                    decoration: ShapeDecoration(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: report.reportPic.isNotEmpty
                        ? Image.network(
                      report.reportPic,
                      fit: BoxFit.cover,
                    )
                        : const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              List<ReportModel> reports = snapshot.data ?? [];
              return CustomScrollView(slivers: <Widget>[
                SliverList(
                    delegate: SliverChildListDelegate([
                  Center(
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      backgroundImage: widget.stdModel.profilePic.isNotEmpty
                          ? NetworkImage(widget.stdModel.profilePic)
                          : null,
                      child: widget.stdModel.profilePic.isEmpty
                        ? Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          '${widget.stdModel.name[0].toUpperCase()}${widget.stdModel.name[1].toUpperCase()}')
                      : null,
                    ),
                  ),
                  Gap(20.h),
                  Center(
                    child: Text(
                      widget.stdModel.name,
                      style: TextStyle(
                        color: const Color(0xFF1B2A57),
                        fontSize: 20.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.h,
                      ),
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    'Diente student  Reports',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF1B2A57),
                      fontSize: 20.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.h,
                    ),
                  ),
                  Gap(28.h),
                ])),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return customDailog(context,reports[index]);
                          });
                        },
                        child:  Card(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              "${aToE[reports[index].caseName]}"),
                        )),
                      );
                    },
                    childCount: reports.length,
                  ),
                )
              ]);
            }));
  }


}
