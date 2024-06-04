import 'package:flutter/cupertino.dart';

//will be replaced with firebase data


class Company_card {
  
  String? company_name;
  String? job;
  String? job_sub;
  String?  Company_description;
  LinearGradient? color;

  Company_card({
    this.company_name,
    this.job,
    this.job_sub, 
    this.Company_description,
    this.color,
  });
}

List<Company_card> candidates = [
  Company_card(
    company_name: 'ALGOSUP',
    job: 'International Software Development school',
    job_sub: 'Development school',
    Company_description: 'Town',
    color: gradientPink,
  ),
  Company_card(
    company_name: 'Seven, 7',
    job: 'Manager',
    job_sub: '',
    Company_description: 'Town',
    color: gradientBlue,
  ),
  Company_card(
    company_name: 'Six, 6',
    job: 'Manager',
    job_sub: '',
    Company_description: 'Town',
    color: gradientPurple,
  ),
  Company_card(
    company_name: 'Five, 5',
    job: 'Manager',
    job_sub: '',
    Company_description: 'Town',
    color: gradientRed,
  ),
  Company_card(
    company_name: 'Four, 4',
    job: 'Manager',
    job_sub: '',
    Company_description: 'Town',
    color: gradientPink,
  ),
  Company_card(
    company_name: 'Three, 3',
    job: 'Manager',
    job_sub: '',
    Company_description: 'Town',
    color: gradientBlue,
  ),
  Company_card(
    company_name: 'Two, 2',
    job: 'Manager',
    job_sub: '',
    Company_description: 'Town',
    color: gradientPurple,
  ),
  Company_card(
    company_name: 'One, 1',
    job: 'Manager',
    job_sub: '',
    Company_description: 'Town',
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
