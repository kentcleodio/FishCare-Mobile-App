import 'dart:io';
import 'package:FishCare/src/models/disease.dart';
import 'package:FishCare/src/models/treatment.dart';
import 'package:FishCare/src/pages/diseaselistpage.dart';
import 'package:FishCare/src/pages/symptomlistpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/aboutpage.dart';
import '../models/symptom.dart';
import '../themes/colors.dart';
import '../themes/sizes.dart';

const String noImgUrl =
    'https://firebasestorage.googleapis.com/v0/b/fishcare-a8931.appspot.com/o/images%2Fsymptoms%20images%2Fno_image.jpg?alt=media&token=c1d49e60-9f14-43d0-9416-27a41b990355';

var defaultSymtoms = Symptom(
  name: 'Error loading data',
  image: noImgUrl,
  description: '',
  cause: [],
  possibleDisease: [],
  treatment: [],
);

var defaultDisease = Disease(
  name: 'Error loading data',
  description: '',
  symptom: [],
);

var defaultTreatment = Treatment(
  name: 'Error loading data.',
  description: '',
);

const columnSpacer = SizedBox(height: 15);

const divider = Column(
  children: [
    columnSpacer,
    Divider(
      color: Color.fromARGB(255, 204, 204, 204),
    ),
    columnSpacer,
  ],
);

//My App Bar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.txtStyle_});
  final String title;
  final TextStyle? txtStyle_;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(
        child: Text(title),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          icon: Image.asset(
            'assets/image/Fishlogo.png',
            width: 30,
            height: 30,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//My Drawer
class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {super.key,
      required this.symptomList_,
      required this.diseaseList_,
      required this.treatmentList_});

  final List<Symptom>? symptomList_;
  final List<Disease>? diseaseList_;
  final List<Treatment>? treatmentList_;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Image.asset(
            'assets/image/FishCarelogo.png',
            width: 200,
            height: 200,
          )),
          ListTile(
            leading: const Icon(CupertinoIcons.list_bullet_below_rectangle),
            title: const Text("SYMPTOMS LIST", style: sidebarTxtStyle),
            onTap: () {
              Navigator.pop(context);
              //navigate to symptoms list
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SymptomListPage(
                            symptomList: symptomList_,
                            diseaseList: diseaseList_,
                            treatmentList: treatmentList_,
                          )));
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.square_list_fill),
            title: const Text("DISEASE LIST", style: sidebarTxtStyle),
            onTap: () {
              Navigator.pop(context);
              //navigate to disease list
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiseaseListPage(
                            symptomList: symptomList_,
                            diseaseList: diseaseList_,
                            treatmentList: treatmentList_,
                          )));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("ABOUT", style: sidebarTxtStyle),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
        ],
      ),
    );
  }
}

//Display selected image
class ImageHeader extends StatelessWidget {
  const ImageHeader({
    super.key,
    required this.selectedImg,
    required this.onTap_,
  });
  final File selectedImg;
  final Function() onTap_;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ImageContainer(
              child_: Image.file(
                selectedImg,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 25,
              right: 25,
              child: GestureDetector(
                onTap: onTap_,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor.withOpacity(0.8),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.clear,
                    color: dangerColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//Camera and Gallery button
class PickImageButton extends StatelessWidget {
  const PickImageButton({
    super.key,
    required this.onTaP_,
    required this.icon,
    required this.label,
  });
  final Function() onTaP_;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTaP_,
          child: CircleAvatar(
            radius: 50,
            child: Icon(
              icon,
              size: 75,
              color: backgroundColor,
            ),
          ),
        ),
        Text(
          label,
          style: buttonTxtStyle,
        )
      ],
    );
  }
}

//back button
class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      label: const Text('Back'),
      icon: const Icon(CupertinoIcons.chevron_left),
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}

//Image Container
class ImageContainer extends StatelessWidget {
  final Widget child_;
  const ImageContainer({super.key, required this.child_});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child_,
      ),
    );
  }
}

//My List tile with card
class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    this.onTap_,
    required this.title,
    this.subtitle,
    this.img,
    this.titletTxtStyle,
    this.subtitletTxtStyle,
    this.trailingIcon,
    this.leadingIcon,
    this.color_,
  });
  final Function()? onTap_;
  final String title;
  final String? subtitle;
  final String? img;
  final TextStyle? titletTxtStyle;
  final TextStyle? subtitletTxtStyle;
  final Icon? trailingIcon;
  final Widget? leadingIcon;
  final Color? color_;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (color_ != null) ? color_ : null,
      child: ListTile(
        onTap: (onTap_ != null) ? onTap_ : null,
        leading: (img != null)
            ? CircleAvatar(
                backgroundImage: const AssetImage('assets/image/loading.gif'),
                foregroundImage: NetworkImage(img!),
                radius: 30,
              )
            : (leadingIcon != null)
                ? leadingIcon
                : null,
        title: Text(
          title,
          style: (titletTxtStyle != null) ? titletTxtStyle : boldTxtStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: (subtitle != null)
            ? (subtitletTxtStyle != null)
                ? Text(
                    subtitle!,
                    textAlign: TextAlign.justify,
                  )
                : Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
            : null,
        trailing: (trailingIcon != null) ? trailingIcon : null,
      ),
    );
  }
}

//Description section
class DescriptionHeader extends StatelessWidget {
  final Function() onPressed_;
  final String description;
  final bool isExpanded_;
  const DescriptionHeader({
    super.key,
    required this.onPressed_,
    required this.description,
    required this.isExpanded_,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        columnSpacer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: secTitleTxtStyle,
            ),
            columnSpacer,
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: (!isExpanded_) ? 3 : 100,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
        IconButton(
          onPressed: onPressed_,
          icon: (isExpanded_)
              ? const Icon(
                  CupertinoIcons.chevron_up,
                  color: primaryColor,
                )
              : const Icon(
                  CupertinoIcons.chevron_down,
                  color: primaryColor,
                ),
        ),
      ],
    );
  }
}

//Image Container in symptom details page
class SymptomImageContainer extends StatelessWidget {
  final Widget child_;
  const SymptomImageContainer({
    super.key,
    required this.child_,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: textColor.withOpacity(.5),
            blurRadius: 12,
          ),
        ],
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: child_,
    );
  }
}
