<div align="center">

# Test Plan

---
**Title:** Adopte un Candidat - Team 6

**Author:** Pierre GORIN

**Team:** Team 6

**Reviewer:** Pierre GORIN

**Created on:** May 22<sup>nd</sup>, 2024

**Last updated:** May 30<sup>th</sup>, 2024

---
<br><details>
<summary><h2> Approvals <i>(Click to expand)</i></h2></summary>

### Approvals

| Reviewer          | Role              | Approved | Date |
| ----------------- | ----------------- | -------- | ---- |
| Pierre GORIN      | Quality Assurance |          |      |
| Camille GAYAT     | Project Manager   |          |      |
| Evan UHRING       | Program Manager   |          |      |
| Mathias GAGNEPAIN | Technical Lead    |          |      |
| Guillaume DESPAUX | Technical Writer  |          |      |
| Ian LAURENT       | Software Engineer |          |      |

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
  - [6. SOFTWARE TEST ENVIRONMENT](#6-software-test-environment)
    - [6.1 Main Frame](#61-main-frame)
    - [6.2 Workstation](#62-workstation)
  - [7. FEATURES TO BE TESTED](#7-features-to-be-tested)
  - [8. FEATURES NOT TO BE TESTED](#8-features-not-to-be-tested)
  - [9. RESOURCES/ROLES \& RESPONSIBILITIES](#9-resourcesroles--responsibilities)
  - [10. DEPENDENCIES](#10-dependencies)
  - [11. TOOLS](#11-tools)
  - [12. GLOSSARY](#12-glossary)

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

| Role | Responsibilities | RACI |
| ---- | ---------------- | ---- |
| Quality Assurance  | Write test cases and conduct unit testing. | Responsible |
| Software Engineer  | Develop unit tests for individual components. | Accountable |
| Technical Lead     | Review unit test results and provide feedback. | Consulted |
| Project Manager    | Approve unit test results and provide final sign-off. | Informed |

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

| Role | Responsibilities | RACI |
| ---- | ---------------- | ---- |
| Quality Assurance  | Write test cases and conduct system testing. | Responsible |

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

| Role | Responsibilities | RACI |
| ---- | ---------------- | ---- |
| Quality Assurance  | Write test cases and conduct performance and stress testing. | Responsible |

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

| Role | Responsibilities | RACI |
| ---- | ---------------- | ---- |
| Quality Assurance  | Write test cases and conduct automated regression testing. | Responsible |

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

- **Processor:** Apple M1 chip with 8-core CPU, 7-core GPU, and 16-core Neural Engine.
- **Memory:** 8GB unified memory.
- **Storage:** 256GB SSD.
- **Operating System:** macOS Monterey.
- **Display:** 13.3-inch Retina display with True Tone.
- **Resolution:** 2560 x 1600 pixels.
- **Battery Life:** Up to 15 hours of web browsing.
- **Connectivity:** Wi-Fi 6, Bluetooth 5.0, Thunderbolt 2 ports.

<!-- to check if goods information -->
#### Lenovo ThinkBook (2021)

- **Processor:** Intel Core i7-1165G7 11th Gen.
- **Memory:** 16GB DDR4 RAM.
- **Storage:** 512GB SSD.
- **Operating System:** Windows 10 Pro.
- **Display:** 14-inch FHD IPS display.
- **Resolution:** 1920 x 1080 pixels.
- **Battery Life:** Up to 8 hours.
- **Connectivity:** Wi-Fi 6, Bluetooth 5.0, USB-C, HDMI, and USB 3.0 ports.

### 5.2 Mobile Devices


#### iPhone 12 Pro 

- **Processor:** A14 Bionic chip with Neural Engine 16-core.
- **Memory:** 6GB RAM.
- **Storage:** 128GB.
- **Operating System:** iOS 17.4.1.
- **Display:** 6.1-inch Super Retina XDR display.
- **Resolution:** 2532 x 1170 pixels.
- **Battery Life:** Up to 17 hours of video playback.
- **Connectivity:** 5G, Wi-Fi 6, Bluetooth 5.0.
- **Camera:** Triple 12MP camera system with LiDAR scanner.
- **Security:** Face ID.

#### iPhone 15 Pro (Emulated)

- **Viewport Size:** 430px × 932px
- **Screen Size:** 1290px × 2796px
- **Device Pixel Ratio:** DPR 3
- **Operating System:** iOS 17.5.1.

## 6. SOFTWARE TEST ENVIRONMENT

<!-- WIP -->

### 6.1 Main Frame

[Specify necessary and desired properties of the test environment]

### 6.2 Workstation

[Specify necessary and desired properties of the test environment]

<!-- WIP -->

## 7. FEATURES TO BE TESTED

[List all software features to be tested]

## 8. FEATURES NOT TO BE TESTED

[List features not to be tested and reasons]

## 9. RESOURCES/ROLES & RESPONSIBILITIES

[List staff members involved in the test project and their roles]

## 10. DEPENDENCIES

<!-- WIP -->


## 11. TOOLS

<!-- WIP -->

## 12. GLOSSARY

<!-- WIP -->