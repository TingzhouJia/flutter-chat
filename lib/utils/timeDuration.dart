import 'package:intl/intl.dart';
 getDuration(timeFrom){
   DateTime dob = DateTime.parse(timeFrom);
   final dur =  DateTime.now().difference(dob).inMinutes;
   return dur;
 }

//main(){
//  print(getDuration("2020-03-22T22:14:46.290Z") is int);
//}
