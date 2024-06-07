<div align="center">

# Test Plan

---
**Title:** Adopte un Candidat - Team 6

**Author:** Pierre GORIN

**Team:** Team 6

**Reviewer:** Pierre GORIN

**Created on:** May 22<sup>nd</sup>, 2024

**Last updated:** June 7<sup>th</sup>, 2024

---
<br><details>
<summary><h2> Approvals <i>(Click to expand)</i></h2></summary>

### Approvals

| Reviewer          | Role              | Approved | Date       |
| ----------------- | ----------------- | -------- | ---------- |
| Pierre GORIN      | Quality Assurance | ✅        | 06/07/2024 |
| Camille GAYAT     | Project Manager   | ✅        | 06/07/2024 |
| Evan UHRING       | Program Manager   | ✅        | 06/07/2024 |
| Mathias GAGNEPAIN | Technical Lead    | ✅        | 06/07/2024 |
| Guillaume DESPAUX | Technical Writer  | ✅        | 06/07/2024 |
| Ian LAURENT       | Software Engineer | ✅        | 06/07/2024 |

</details>

</div>

<br><details>
<summary><h2 id="toc"> Table of Contents <i>(Click to expand)</i></h2></summary>

- [Test Plan](#test-plan)
    - [Approvals](#approvals)
  - [1. INTRODUCTION](#1-introduction)
  - [2. OBJECTIVES AND TASKS](#2-objectives-and-tasks)
    - [2.1 Objectives](#21-objectives)
    - [2.2 Tasks](#22-tasks)
  - [3. SCOPE](#3-scope)
    - [General](#general)
  - [4. TESTING STRATEGY](#4-testing-strategy)
    - [4.1 Unit Testing](#41-unit-testing)
      - [Definition:](#definition)
      - [Participants:](#participants)
      - [Methodology:](#methodology)
    - [4.2 System Testing](#42-system-testing)
      - [Definition:](#definition-1)
      - [Participants:](#participants-1)
      - [Methodology:](#methodology-1)
    - [4.3 Performance and Stress Testing](#43-performance-and-stress-testing)
      - [Definition:](#definition-2)
      - [Participants:](#participants-2)
      - [Methodology:](#methodology-2)
      - [Tools:](#tools)
    - [4.4 Automated Regression Testing](#44-automated-regression-testing)
      - [Definition:](#definition-3)
      - [Participants:](#participants-3)
      - [Methodology:](#methodology-3)
      - [Tools:](#tools-1)
  - [5. HARDWARE TEST ENVIRONMENT](#5-hardware-test-environment)
    - [5.1 Computers/Laptops](#51-computerslaptops)
      - [MacBook Air (M1, 2020)](#macbook-air-m1-2020)
      - [Lenovo ThinkBook (2021)](#lenovo-thinkbook-2021)
    - [5.2 Mobile Devices](#52-mobile-devices)
      - [iPhone 12 Pro](#iphone-12-pro)
      - [iPhone 15 Pro (Emulated)](#iphone-15-pro-emulated)
      - [Xiaomi 13T](#xiaomi-13t)
  - [6. SOFTWARE TEST ENVIRONMENT](#6-software-test-environment)
    - [6.1 Main Frame](#61-main-frame)
  - [7. FEATURES TO BE TESTED](#7-features-to-be-tested)
    - [7.1 Profile Management](#71-profile-management)
    - [7.2 Swipe and Match System](#72-swipe-and-match-system)
    - [7.3 Messaging System](#73-messaging-system)
    - [7.4 Multi-Languages](#74-multi-languages)
  - [8. TOOLS](#8-tools)
    - [8.1 Development Tools](#81-development-tools)
    - [8.2 Version Control](#82-version-control)
    - [8.3 Testing Tools](#83-testing-tools)
  - [9. GLOSSARY](#9-glossary)

</details>

  ## 1. INTRODUCTION

  The application aims to facilitate connections between job seekers and companies through a user-friendly interface that is easily understandable for everyone, from young adults to those nearing retirement. The app uses a swipe and match system similar to popular dating apps like Tinder. It will be available on Android and iOS devices, as well as a desktop version for Linux, Windows, and MacOS.

  For additional information, please refer to the [Functional Specifications](documents\functional\functional_specifications.md).

  ## 2. OBJECTIVES AND TASKS

  ### 2.1 Objectives

  The objectives of this test plan include the following:

  - Ensure the application meets all functional requirements.
  - Validate the performance and scalability of the application.
  - Identify and resolve any issues or bugs.
  - Ensure the application is user-friendly and intuitive.
  - Validate the security and compliance of the application.
  - Ensure the application is compatible with all target platforms.
  - Validate the data security and privacy of the application.

  ### 2.2 Tasks

  the tasks required to ensure application quality are as follows:

  - Write test cases for all functional requirements.
  - Conduct unit testing for individual components.
  - Conduct system and integration testing for the complete application.
  - Perform performance and stress testing to validate scalability.
  - Ensure that the application is consistent (colors, fonts, etc.)

  ## 3. SCOPE

  ### General

  The scope of the test plan includes all aspects of the application, including functional requirements, performance, security, and user experience. The plan outlines the testing strategy, schedule, and resources required to ensure the quality of the application.

  ## 4. TESTING STRATEGY

  The testing strategy outlines the approach to testing various aspects of the product.

  ### 4.1 Unit Testing

  #### Definition:

  Unit testing is the process of testing individual components or functions to ensure they work as expected.

  #### Participants:

  | Role              | Responsibilities                                      | RACI        |
  | ----------------- | ----------------------------------------------------- | ----------- |
  | Quality Assurance | Write test cases and conduct unit testing.            | Responsible |
  | Software Engineer | Develop unit tests for individual components.         | Accountable |
  | Technical Lead    | Review unit test results and provide feedback.        | Consulted   |
  | Project Manager   | Approve unit test results and provide final sign-off. | Informed    |

  #### Methodology:

  1. Write test cases for individual components.
  2. Conduct unit testing for each component.
  3. Review test results and identify any issues.
  4. Resolve any issues and retest components.
  5. Document test results and provide feedback.
  6. Repeat the process until all components pass unit testing.

  ### 4.2 System Testing

  #### Definition:

  System testing is the process of testing the complete application to ensure all components work together as expected.

  #### Participants:

  | Role              | Responsibilities                             | RACI        |
  | ----------------- | -------------------------------------------- | ----------- |
  | Quality Assurance | Write test cases and conduct system testing. | Responsible |

  #### Methodology:

  1. Write test cases for the complete application.
  2. Conduct system testing to validate all components work together.
  3. Identify and resolve any issues or bugs.
  4. Document test results and provide feedback.
  5. Repeat the process until the application passes system testing.

  ### 4.3 Performance and Stress Testing

  #### Definition:

  Performance and stress testing is the process of testing the application under various conditions to validate performance and scalability.

  #### Participants:

  | Role              | Responsibilities                                             | RACI        |
  | ----------------- | ------------------------------------------------------------ | ----------- |
  | Quality Assurance | Write test cases and conduct performance and stress testing. | Responsible |

  #### Methodology:

  1. Write test cases for performance and stress testing.
  2. Conduct performance testing to validate application performance.
  3. Conduct stress testing to validate application scalability.
  4. Identify and resolve any performance issues.
  5. Document test results and provide feedback.

  #### Tools:

  - [Flutter DevTools](https://docs.flutter.dev/tools/devtools/overview)
  - [Dart Observatory](https://dart.dev/tools/dart-devtools)
  - [Firebase Performance Monitoring](https://firebase.google.com/docs/perf-mon)


  ### 4.4 Automated Regression Testing

  #### Definition:

  Automated regression testing is the process of automatically testing the application to validate that new code changes do not introduce bugs or issues.

  #### Participants:

  | Role              | Responsibilities                                           | RACI        |
  | ----------------- | ---------------------------------------------------------- | ----------- |
  | Quality Assurance | Write test cases and conduct automated regression testing. | Responsible |

  #### Methodology:

  1. Write test cases for automated regression testing.
  2. Write the automated test scripts.
  3. Conduct automated regression testing after each code change.
  4. Identify and resolve any issues or bugs.
  5. Document test results and provide feedback.
  6. Repeat the process until the application passes automated regression testing.

  #### Tools:

  - [Selenium](https://www.selenium.dev/)
  - [Rainforest QA](https://www.rainforestqa.com/)

  ## 5. HARDWARE TEST ENVIRONMENT

  ### 5.1 Computers/Laptops

  #### MacBook Air (M1, 2020)

  | **Specification**    | **Details**                                 |
  | -------------------- | ------------------------------------------- |
  | **Processor**        | Apple M1 chip with Neural Engine 8-core     |
  | **Memory**           | 8GB unified memory                          |
  | **Storage**          | 256GB SSD                                   |
  | **Operating System** | macOS Sonoma 14.5                           |
  | **Display**          | 13.3-inch Retina display                    |
  | **Resolution**       | 2560 x 1600 pixels                          |
  | **Connectivity**     | Wi-Fi 6, Bluetooth 5.0, Thunderbolt 2 ports |

  #### Lenovo ThinkBook (2021)

  | **Specification**    | **Details**                                            |
  | -------------------- | ------------------------------------------------------ |
  | **Processor**        | Intel Core i7-1065G7 10th Gen                          |
  | **Memory**           | 16GB RAM                                               |
  | **Storage**          | 512GB SSD                                              |
  | **Operating System** | Windows 11                                             |
  | **Resolution**       | 1920 x 1080 pixels                                     |
  | **Connectivity**     | Wi-Fi 6, Bluetooth 5.0, USB-C, HDMI, and USB 3.0 ports |

  ### 5.2 Mobile Devices

  #### iPhone 12 Pro 

  | **Specification**    | **Details**                                |
  | -------------------- | ------------------------------------------ |
  | **Processor**        | A14 Bionic chip with Neural Engine 16-core |
  | **Memory**           | 6GB RAM                                    |
  | **Storage**          | 128GB                                      |
  | **Operating System** | iOS 17.5.1                                 |
  | **Display**          | 6.1-inch Super Retina XDR display          |
  | **Resolution**       | 2532 x 1170 pixels                         |
  | **Connectivity**     | 5G, Wi-Fi 6, Bluetooth 5.0                 |

  #### iPhone 15 Pro (Emulated)

  | **Specification**      | **Details**     |
  | ---------------------- | --------------- |
  | **Viewport Size**      | 430px × 932px   |
  | **Screen Size**        | 1290px × 2796px |
  | **Device Pixel Ratio** | DPR 3           |
  | **Operating System**   | iOS 17.5        |

  #### Xiaomi 13T

  | **Specification**    | **Details**                               |
  | -------------------- | ----------------------------------------- |
  | **Screen**           | 6.67-inch OLED                            |
  | **Resolution**       | 1220px x 2712px                           |
  | **Processor**        | MediaTek Dimensity 8200 Ultra             |
  | **RAM**              | 12GB                                      |
  | **Storage**          | 256GB                                     |
  | **Connectivity**     | Bluetooth 5.4, WiFi 6, NFC, GPS, Infrared |
  | **Operating System** | Android 14                                |


  ## 6. SOFTWARE TEST ENVIRONMENT

  ### 6.1 Main Frame

  We will use the following software for testing:

  - **Operating System**: Windows 11, macOS Sonoma 14.5, Android 14, iOS 17.5.1
  - **Browsers**: Chrome, Firefox, Safari, Edge
  - **IDE**: Visual Studio Code, Android Studio, Xcode
  - **Database**: Firebase
  - **Version Control**: GitHub

  ## 7. FEATURES TO BE TESTED

  ### 7.1 Profile Management

  - **User Registration**: Ensure users can create accounts with valid information.
  - **User Login**: Ensure users can log in with valid credentials.
  - **User Profile**: Ensure users can view and edit their profile information.

  - **Company Registration**: Ensure companies can create accounts with valid information.
  - **Company Login**: Ensure companies can log in with valid credentials.
  - **Company Profile**: Ensure companies can view and edit their profile information.

  - **Soft Skills**: Ensure users and companies can add and edit soft skills.
  - **Location**: Ensure users and companies can add and edit their location.
  - **Profile Picture**: Ensure companies can add and edit their profile picture(Company logo).

  ### 7.2 Swipe and Match System

  - **Swipe Right**: Ensure users can swipe right to express interest in job postings.
  - **Swipe Left**: Ensure users can swipe left to skip job postings.
  - **Match**: Ensure users can match with job postings they have swiped right on.

### 7.3 Messaging System

- **Chat**: Ensure users can exchange messages with matched job postings.
- **Notifications**: Ensure users receive notifications for new messages.

### 7.4 Multi-Languages

- **Language Selection**: Ensure users can select their preferred language.
- **Translation**: Ensure the app is translated into the selected language.

## 8. TOOLS

### 8.1 Development Tools
- **Visual Studio Code:** Integrated Development Environment (IDE) for code editing.
- **Android Studio:** IDE for Android app development.
- **Xcode:** IDE for iOS app development.
  
### 8.2 Version Control
- **GitHub:** Repository hosting service for version control and collaboration.

### 8.3 Testing Tools
- **Selenium:** Tool for automated web application testing.
- **Rainforest QA:** Tool for automated and manual testing.
- **Flutter DevTools:** Suite of performance and debugging tools for Flutter applications.
- **Dart Observatory:** Debugging and inspection tool for Dart applications.


## 9. GLOSSARY

| **Term**                                           | **Definition**                                                                                                                                                                                                                                                   |
| -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| MVP (Minimum Viable Product)                       | The most basic version of a product that can be released to start the feedback loop with early users.                                                                                                                                                            |
| CI/CD (Continuous Integration/Continuous Delivery) | A method to frequently deliver apps to customers by introducing automation into the stages of app development.                                                                                                                                                   |
| QA (Quality Assurance)                             | A way of preventing mistakes or defects in manufactured products and avoiding problems when delivering solutions or services to customers.                                                                                                                       |
| UI/UX (User Interface/User Experience)             | UI refers to the screens, buttons, toggles, icons, and other visual elements you interact with when using a website, app, or other electronic device. UX refers to the entire interaction you have with a product, including how you feel about the interaction. |
| Unit Testing                                       | A level of software testing where individual units/components of a software are tested.                                                                                                                                                                          |
| System Testing                                     | Testing the complete and integrated software to evaluate the system's compliance with its specified requirements.                                                                                                                                                |
| Performance Testing                                | Testing performed to determine how a system performs in terms of responsiveness and stability under a particular workload.                                                                                                                                       |
| Stress Testing                                     | Testing conducted to evaluate a system or component at or beyond the limits of its specified requirements to determine the load under which it fails and how.                                                                                                    |