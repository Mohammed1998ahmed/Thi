import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/core/widght/Widght.dart';

import 'logic/cubit/notifation_cubit.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotifationCubit()..getNotifation(),
      child: BlocConsumer<NotifationCubit, NotifationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = NotifationCubit.getObject(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Notifications'),
            ),
            body: cubit.notifationDataModel == null
                ? Center(child: CircularProgressIndicator())
                : cubit.notifationDataModel!.data!.length <= 0
                    ? Center(
                        child: Container(
                          child: text(title: "Not Found"),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cubit.notifationDataModel!.data!.length,
                        itemBuilder: (context, index) {
                          return NotificationCard(
                            cubit: cubit,
                            index: index,
                          );
                        },
                      ),
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  // final String title;
  // final String details;
  // final String date;
  final NotifationCubit cubit;
  final int index;
  NotificationCard({
    required this.cubit,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.notifications),
        title: Text(cubit.notifationDataModel!.data![index].title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cubit.notifationDataModel!.data![index].message.toString()),
            Text(
              'Date: ${cubit.notifationDataModel!.data![index].createdAt}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
