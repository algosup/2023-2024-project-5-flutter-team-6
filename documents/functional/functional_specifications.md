# Functional Specifications

## Table of content

- [Document control](#document-control)
    - [Document information](#document-information)
    - [Document validation](#document-validation)
- [A. Introduction](#a-introduction)
    - [1. Overview](#1-overview)
    - [2. Project definition](#2-project-definition)
        - [Vision](#vision)
        - [Objectives](#objectives)
        - [Scope](#scope)
        - [Deliverables](#deliverables)
    - [3. Project organization](#3-project-organization)
        - [Stakeholders](#stakeholders)
        - [Project team](#project-team)
- [B. Functional requirements](#b-functional-requirements)
    - [1. Personas definition](#1-personas-definiton)
    - [2. Features](#2-features)
    - [3. Graphic charter](#3-graphic-charter)
        - [Logo](#logo)
        - [Font](#font)
        - [Colors](#colors)
        - [Images and icons](#images-and-icons)
    - [4. UI/UX](#4-uiux)
        - [Registering](#registering)
            - [Job seeker](#job-seeker)
            - [Company](#company)
        - [Logging in](#logging-in)
        - [Job seeker interface](#job-seeker-interface)
            - [Searching companies](#searching-companies)
            - [Discussion with companies](#discussion-with-companies)
            - [Profile page](#profile-page)
            - [Saved companies](#saved-companies)
            - 
        - [Company interface](#job-seeker-interface)
            - [Searching job seekers](#searching-job-seekers)
            - [Discussion with job seekers](#discussion-with-job-seekers)
            - [Profile page](#profile-page)
            - [Saved job seekers](#saved-job-seekers)
            - 
- [C. Non functional requirements](#c-non-functional-requirements)
    - [1. Operability](#1-operability)
    - [2. Delivery](#2-delivery)
    - [3. Maintainability](#3-maintainability)
- [D. Glossary](#d-glossary)
<br><br>


# Document control

## Document information

| Document name | Document owner | Date of last update |
| --- | --- | --- |
| Functional specifications | Evan UHRING | 5/17/2024 |


## Document validation

| Role | Name | Signature | Date |
|---|---|---|---|
| Project Manager | Camille GAYAT |  |  |
| Tech Lead | Mathias GAGNEPAIN |  |  |
| Software Developer | Ian LAURENT |  |  |
| Quality Assurance | Pierre GORIN |  |  |
| Technical Writer | Guillaume DESPAUX |  |  |
<br><br>


# A. Introduction

## 1. Overview

Our team was asked to design and develope an interface of an application called Adopte Un Candidat. It is a recruitment app between job seekers and companies, while completely anonymizing the job seekers to focus on their soft-skills other than their gender, how they look and their experiences. It has to be available on smartphones, tablets and computers.

## 2. Project definition

### Vision
---

We will have a complete interface that was validated by the client. Every requested features have to be implemented.

### Objectives 
---

- Make a complete interface for an app
- Has to be made using Flutter
- Can be used on smartphone, tablet and computer


### Scope 
---

| In scope |
| --- |
|

| Out of scope |
| --- |
|

### Deliverables
---

| Name | Type | Deadline | Link |
|---|---|---|---|
| Functional specifications document | Document (markdown) | 05/24/2024 | [functional_specifications.md](functional_specifications.md) |
| Technical specifications document | Document (markdown) | 06/07/2024 | [technical_specifications.md](../technical/technical_specifications.md)|
| Weekly reports | Document (markdown) | Every Friday | [weekly_reports/](../management/weekly_reports)|
| Test plan | Document (markdown) | 06/07/2024 | [test_plan.md](../quality/) |
| User manual | Document (pdf) | 06/14/2024 | [test_plan.md](../quality/) |

## 3. Project organization

### Stakeholders
---



### Project team
---

Defined by the project owner (ALGOSUP):

| Role | Description | Name |
|---|---|---|
| Project manager | Is in charge of organization, planing and budgeting.<br>Keep the team motivated. | Camille GAYAT |
| Program manager | Makes sure the project meets expectation.<br>Is in charge of design.<br>Is responsible for writing the Functional Specifications | Evan UHRING |
| Tech lead | Makes the technical decision in the project.<br>Translates the Functional Specification into Technical Specifications.<br> Does code review. | Mathias GAGNEPAIN |
| Software engineer | Writes the code.<br>Writes documentation<br>Participate in the technical design. | Ian LAURENT |
| Quality assurance |  Tests all the functionalities of a product to find bugs and issue.<br>Document bugs and issues.<br>Write the test plan.<br>Check that issues have been fixed.| Pierre GORIN |
| Technical writer | Is in charge of writing a user manual | Guillaume DESPAUX |
<br><br>


# B. Functional requirements

## 1. Personas definition

<b>Young candidate:</b><br>
Description: He just finished school and got his diploma, but he needs to find efficiently a job.<br>


<b>Experienced worker:</b><br>
Description: His contract is coming to an end and needs to find another one.


<b>The company:</b><br>
Description: The company needs to find candidate on who they can trust and that they know how he will be socially with the other members of the company.

## 2. Features



## 3. Graphic charter

### Logo
---

The logo of the app was given by the client:<br>
<img src="../images/functional/logo/adopte_logo_whitebackground.png" width="35%">

### Fonts
---

The chosen fonts are **Roboto** and **Quicksand**. It mixes refined and modern styles together for a more attractive interface.

### Colors
---

For the colors, we will separate them into different categories: 

- Light and dark background
- App main colors
- Theme main colors
- Soft-skills
- Compatibility percentage

All colors are shown with its hexadecimal code.

**Light and dark background**<br>
For the background, we will have two different type: a light and a dark. The user will be able to choose between them following their preferences.

The light background will use a pure white:<br>
<img src="../images/functional/colors/white.png" width="35%">

The dark background will use a specific dark grey, to still be able to visual the pages while not hurting the eyes of the user and be pleasant to see:<br>
<img src="../images/functional/colors/darkgrey.png" width="35%">

**App main colors**<br>
The app main colors are represented by the image below:<br>
<img src="../images/functional/colors/app_main_colors.png" width="35%">

**Theme main colors**<br>
For the theme main colors, we decided to not use the same colors for every users. As such, we will randomize the color for each user and fade it with the same color plus 75% of the color of the background. For the company side of the app, the color will not be randomized. It will be the same color as the logo of the company and fade it with the same color plus 75% of the color of the background.

**Soft-skills**<br>
While the soft-skills are categorized with 4 main categories, we will put a color for each one:<br>
<img src="../images/functional/colors/blue_softskills.png" width="35%"><br>
<img src="../images/functional/colors/red_softskills.png" width="35%"><br>
<img src="../images/functional/colors/yellow_softskills.png" width="35%"><br>
<img src="../images/functional/colors/green_softskills.png" width="35%">

**Compatibility percentage**<br>
For the compatibility percentage, to make it more visible, we decided to use 5 colors and make them fade with each other:<br>
<img src="../images/functional/colors/colors_compatibility.png">

### Image and icons
---



## 4. UI/UX

The format used for smartphone is the format of the Iphone X.<br>
For the computer version, the format used is the standard 16/9 screen ratio.

### Logging in
---

The first page the user will arrive on is the connecting page:<br>
<img src="../images/>

### Registering
---

#### Job seeker



#### Company



### Job seeker interface
---

#### Searching companies



#### Discussion with companies



#### Account page



#### Saved companies



### Company interface
---

#### Searching job seekers



#### Discussion with job seekers



#### Account page



#### Saved job seekers


<br><br>


# C. Non functional requirements

## 1. Operability

- Should be able to run on smartphone, tablet and computer
- Should run on every operating system

## 2. Delivery

- The complete application frontend will be available on our [GitHub](https://github.com/algosup/2023-2024-project-5-flutter-team-6).

## 3. Maintainability

- Commented and documented code
<br><br>


# D. Glossary