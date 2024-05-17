# Technical Specification

<summary>Table of content</sumarry>
<details>

- [Technical Specification](#technical-specification)
  - [Project Overview](#project-overview)
  - [1. Introduction](#1-introduction)
    - [1.1 Purpose](#11-purpose)
    - [1.2 Scope](#12-scope)
    - [1.3 Audience](#13-audience)
  - [2. System Requirements](#2-system-requirements)
    - [2.1 Functional Requirements](#21-functional-requirements)
    - [2.2 Non-Functional Requirements](#22-non-functional-requirements)

</details>

## Project Overview

The application aims to facilitate connections between job seekers and companies through a user-friendly interface that is easily understandable for everyone, from young adults to those nearing retirement. The app uses a swipe and match system similar to popular dating apps like Tinder. It will be available on Android and iOS devices, as well as a desktop version for Linux, Windows, and MacOS.

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to outline the technical specifications for the development of the job-matching application. It provides a comprehensive overview of the system requirements, architecture, functionality, and development approach.

### 1.2 Scope

The scope of the application includes:

- Development of mobile applications for Android and iOS.
- Development of a desktop version for Linux, Windows, and MacOS.
- A backend system to support user authentication, job posting, and matching algorithms.
- A user-friendly interface suitable for a wide range of users.

### 1.3 Audience

This document is intended for:

- Project Managers
- Software Engineer
- UI/UX Designers
- Quality Assurance Testers
- Stakeholders

## 2. System Requirements

### 2.1 Functional Requirements

- **User Authentication**

  - Users should be able to create accounts and log in using email or social media accounts (Google).

- **User Profiles**

  - Job seekers can create and edit profiles, including personal informations, and softskills.
  - Companies can create and edit profiles to showcase their organization and available jobs, softskilles researched.

- **Swipe and Match System**

  - Job seekers can swipe right to express interest in job postings, press the star to save the announce, and swipe left to skip.
  - Companies can see the list of jobseekers interested for each job offer, softskills of the jobseekers, distance, compatibilty score, and choose to accept or deny the jobseekers.
  - When both parties like the other, a match is made, and they can communicate via the app or the company can ask to the user if he agree to share his email address.
  
- **Messaging System**

  - Matched users can exchange messages within the app.

- **Job Search**

  - Job seekers can search for jobs based on various filters such as location, industry, and job type.
  - Companies can search for potential candidates based on softskills and compatibility score.

- **Notifications**

  - Push notifications for matches, and new messages.

### 2.2 Non-Functional Requirements

- **Performance**

  - The application should load within 3 seconds under normal conditions.

- **Scalability**

  - The backend should support scaling to accommodate a growing number of users.

- **Security**

  - Secure user data with encryption.
  - Ensure secure authentication mechanisms.

- **Compatibility**

  - Mobile applications should be compatible with version 10 and the latest versions of Android and iOS.
  - Desktop application should be compatible with version 12 and the latest versions of Linux, Windows, and MacOS.

- **Usability**

  - The interface should be intuitive and accessible to users of all age groups.
