# Light Chat
This is a chat app made by flutter without fancy ui design but most of features for chat app are implemented.
- This app needs unit test :scream: :scream: :scream:

### Technology Stack
- [flutter](https://flutter.dev/)
- [flutter_redux](https://pub.dev/packages/flutter_redux)
- [Firebase](https://github.com/FirebaseExtended/flutterfire)


### Main Feature
- [x] one to one chat
- [x] group chat
- [x] rich text message
- [x] video and audio chat
- [x] group video chat
- [x] add friend and delete friend
- [x] editing and dispatching event in group
- [x] create group and join group
- [x] React to messages with emoji.


![image](https://raw.githubusercontent.com/TingzhouJia/flutter-chat/master/images/snapshots.png)



### Project Structure
This is a Flutter mobile app targeting Android and iOS.
- The code for the Flutter app is contained in the folder lib.
- model folder contains all the database model
- redux folder contains all Action, Middleware, Reducer for state management.
- screen folder contains UI pages
- service folder contains Query from Firestore


### How to try it
1. download flutter sdk and 1.12.13+hotfix.9 is the version for this app:
```bash
$ flutter doctor
```
2. git clone it
```bash
$ git clone https://github.com/TingzhouJia/flutter-chat.git
```
3. register your [firebase](https://firebase.google.com/) account and setup firestore database

|  collection   |  document  | collection | document |
|  :----:  | :----:  |  :----:  | :----:  |
| favorUser  | userId |  favorList
| friends  | userId |   info | userId
| group  | groupId |   
| message  | userId/ groupId | userId/groupMessage | messages|
| recentChat  | userId | info | userId/SYSTEM |
| request  | userId |   requests | userId
| user  | userId |  
| userGroup  | userId | info | groupId

4. model design

- favorUser

| name | type | value |
|  :----:  |  :----:  |  :----:  |
|favorUser| String| a reference like in mongoDB |

- friends

| name | type | value |
|  :----:  |  :----:  | :----:  |
|Image| String| use firebase storage to get img url |
|nickname| String| 'kiki'  |
|notification | bool| false |
|strongNotif | bool| false |
|setTop | bool| false |

- group

| name | type | value |
|  :----:  |  :----:  |  :----:  |
| authorId | String| wldwklmamcmcmclk39fjfn |
| description | String | this is a group for learn flutter |
| hexcolor | String | ffffff |
| id | String| asklaldd39kk3nd |
| name | String | flutter study group |
| newInvitation | List<String> | \[ adauish7hqo3 \] |
| startDate | DateTime | 2019-03-12 |
| users |  List<String> | wldwklmamcmcmclk39fjfn |
| visibility | bool  | true |



### Dependencies
``` Dart
  cupertino_icons: ^0.1.2
  flutter_screenutil: ^1.0.2
  agora_rtc_engine: 1.0.5
  permission_handler: ^3.0.0
  dio: ^3.0.9
  emoji_picker: ^0.1.0
  transparent_image: ^1.0.0
  flutter_spinkit: ^4.1.2
  image_picker: ^0.6.3+4
  firebase_storage: ^3.1.3
  firebase_auth: ^0.15.5+3
  firebase_messaging: ^6.0.13
  firebase_database: ^3.0.7
  cloud_firestore: ^0.13.4+2
  json_serializable: ^3.3.0
  image_pickers: ^1.0.7+1
  flutter_redux: ^0.6.0
  built_collection: ^4.3.2
  redux: ^4.0.0
  redux_epics: ^0.13.0
  built_value: ^7.0.9
  flutter_slidable: ^0.5.4
  flutter_svg: ^0.17.3+1
  shared_preferences: ^0.5.6+3
  built_value_generator: ^7.0.9
  font_awesome_flutter: ^8.8.1
  oktoast: ^2.3.1+1
  flutter_datetime_picker: ^1.3.5
```







