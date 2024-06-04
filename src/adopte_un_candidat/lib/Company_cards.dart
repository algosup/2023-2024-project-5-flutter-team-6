import 'package:flutter/cupertino.dart';

//will be replaced with firebase data


class CompanyCard {
  
  String? companyName;
  String? job;
  String? jobSub;
  String?  companyDescription;
  LinearGradient? color;

  CompanyCard({
    this.companyName,
    this.job,
    this.jobSub, 
    this.companyDescription,
    this.color,
  });
}

List<CompanyCard> candidates = [
  CompanyCard(
    companyName: 'ALGOSUP',
    job: 'International Software Development school',
    jobSub: 'Development school',
    companyDescription: 'Town',
    color: gradientPink,
  ),
  CompanyCard(
    companyName: 'Seven, 7',
    job: 'Manager',
    jobSub: '',
    companyDescription: 'Town',
    color: gradientBlue,
  ),
  CompanyCard(
    companyName: 'Six, 6',
    job: 'Manager',
    jobSub: '',
    companyDescription: 'Town',
    color: gradientPurple,
  ),
  CompanyCard(
    companyName: 'Five, 5',
    job: 'Manager',
    jobSub: '',
    companyDescription: 'Town',
    color: gradientRed,
  ),
  CompanyCard(
    companyName: 'Four, 4',
    job: 'Manager',
    jobSub: '',
    companyDescription: 'Town',
    color: gradientPink,
  ),
  CompanyCard(
    companyName: 'Three, 3',
    job: 'Manager',
    jobSub: '',
    companyDescription: 'Town',
    color: gradientBlue,
  ),
  CompanyCard(
    companyName: 'Two, 2',
    job: 'Manager',
    jobSub: '',
    companyDescription: 'Town',
    color: gradientPurple,
  ),
  CompanyCard(
    companyName: 'One, 1',
    job: 'Manager',
    jobSub: '',
    companyDescription: 'Town',
    color: gradientRed,
  ),
];

const LinearGradient gradientRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF3868),
    Color(0xFFFFB49A),
  ],
);

const LinearGradient gradientPurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF736EFE),
    Color(0xFF62E4EC),
  ],
);

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0BA4E0),
    Color(0xFFA9E4BD),
  ],
);

const LinearGradient gradientPink = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF6864),
    Color(0xFFFFB92F),
  ],
);

const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF7960F1),
    Color(0xFFE1A5C9),
  ],
);
