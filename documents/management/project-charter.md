# Project Charter: SportShield

## Project Overview

On this project, we have to improve the capabilities of an anti-theft object called SportShield, by upgrading the software. The purpose of this product is to add a security layer on your skis or snowboard (much more on future improvements of the object) to detect if the ski or snowboard is being robbed by someone, and if yes, send the information to the user.


## Project Goals

- Improve the battery efficiency and lifespan
- Give the capabilities of managing a case of low battery
- The alarm can be stopped at will by the user
- The alarm continue to emit an alarm sound if the object sends notifications to the user
- Increase the security level by allowing only one user to connect to the object


## Deliverables and Deadlines

| Deliverable | Deadline | Description |
| -- | -- | -- |
| Functional specifications | 03/18, 5pm | Detailed explanations about the project, the requirements of the customer |
| Technical specifications | 03/26, 5pm | In-depth explanations about the components specifications, the implementations the technologies |
| Test plan | 04/10, 5pm | Documents covering all testing strategies |
| User manual | 04/10, 5pm | Manual for the user to help him understand how to use the product and what it is capable of |
| Software | 04/10, 5pm | The complete program that meets the requirements of the customer |


## Team Roles 

| Role | Member name | Profile image |
| -- | -- | -- |
| Project Manager: | [Evan UHRING](https://github.com/Evan-UHRING) | <img src="https://avatars.githubusercontent.com/u/146000775?v=4" width="200px"> |
| Program Manager: | [Jason GROSSO](https://github.com/JasonGROSSO) | <img src="https://avatars.githubusercontent.com/u/114397870?v=4" width = "200px"> |
| Tech Lead: | [Ian LAURENT](https://github.com/Ianlaur) | <img src="https://avatars.githubusercontent.com/u/146005340?v=4" width="200px"> |
| Technical Writer: | [David CUAHONTE CUEVAS](https://github.com/DavidCC812) | <img src="https://avatars.githubusercontent.com/u/91249658?v=4" width="200px"> |
| Software Engineer: | [Gaël MALVAR](https://github.com/Gael-MALVAR) | <img src="https://avatars.githubusercontent.com/u/146000851?v=4" width="200px"> |
| Quality Assurance: | [Guillaume DERAMCHI](https://github.com/Guillaume18100) | <img src="https://avatars.githubusercontent.com/u/145995909?v=4" width="200px"> |


## Stakeholders

| Name | Role | Representative | Point of contact | Influence | Expectations |
| -- | -- | -- | -- | -- | -- |
| [Algosup](https://algosup.com) | Mediator | Franck JEANNIN | Mail/Slack | The mediator gave us the opportunity to collaborate with a company. | The mediator expects that we are going on the right tracks, following the requirements of the customer and delivering a product completed. |
| [Coris Innovation](https://www.corisinnovation.com) | Customer | Florent ANON | Mail | The customer sets the requirements for the product. The team will ask question to him if some parts are not understood correctly and to be sure that we are going the good way. | The costumer expects that we deliver an upgraded version of their already existing program, to increase the efficiency and capabilities of the final product. It has to be well documented and explained to be easily understood. |


## Resources

- <b>Product components:</b>
    - The customer gave us the components of the product SportShield that includes:
        - Bluetooth[^1] card
        - IMU[^2]
        - SIM[^3] card
        - GPS[^4] antenna
        - Battery
        - Buzzer (alarm)
        - Electromagnet[^5] (locker)
    - All those components are included with a printed circuit board[^6] to connect them, allowing us to focus on the software other than the hardware.

- <b>Development environment:</b>
    - An appropriate software to develop the project:
        - [Arduino IDE](https://www.arduino.cc/en/software)

- <b>Collaboration tools:</b>
    - Communication app for a better coordination between the team members:
        - [Slack](https://slack.com)
    - Tool for team collaboration:
        - [Github](https://github.com)

- <b>Documentation tool:</b>
    - Every documents on the project are visible and maintained:
        - Github

- <b>Testing environment/tools:</b>
    - The software will be tested on the included components that were delivered to us

- <b>Management Tools:</b>
    - Guiding the team through the project with deadlines and objectives:
        - [Trello](https://trello.com)
    - Communicating with the team members:
        - Slack


## Success Criteria

Identification of the different success criteria for the correct advancement of the project to lead of final program meeting the requirements.

- <b>Functionalities:</b>
    - The program has the different functionalities that were requested by the customer.

- <b>Efficient:</b>
    - The program has to increase the efficiency of the hardware.

- <b>Reliable:</b>
    - The program has to work properly with no errors

- <b>Tested:</b>
    - The program has been tested as maximum as possible to ensure the proper functioning of it.

- <b>Time management:</b>
    - The time has been correctly distributed between the team members to have the best advancement of the project as possible. ([Our Trello](https://trello.com/b/TmAy2Ca5/sportshield-team-6))

- <b>Meeting expectations:</b>
    - The final program meets every the expectations of the customer.


## Risks and Mitigation

Identification of the different existing risks to be prepared and be capable of solving them efficiently to lead for a better advancement of the project.

- <b>Documentation understanding:</b> the team can have problems understanding the documentation and the existing program of the product.
    - We can ask the owner of the product for clarification.

- <b>Requirement changes:</b> the customer can modify his requirement in the middle of the project.
    - We have to be aware of those changes as soon as possible, and so we can ask regularly the customer if there is any change.

- <b>Project time modifications:</b> our schedule can change at any moment and so we can possibly have less time to work on the project.
    - The project manager can already try to evenly distribute the time to the team members the time in case of the minimum time that is available, and add more if opportunities are available.


## Constraints 

Identification of the constraints that will limit our capabilities on doing the different requirements for the product.

- <b>Hardware limitation:</b> the product hardware included by Coris Innovation is the one that we will have to use, and so we don't have to create our own hardware prototype.

- <b>Project time:</b> we have a limited time to work on the project and deadlines. So we have to be correctly organized to have a finished product.


## Conclusion

This project charter highlights our goals on the project, as well as what is needed to success and what is available to us. It will lead to correctly upgrading the existing program, by adding functionalities and increase its efficiency.

---

[^1]: Short-range wireless technology standard used to exchange data between two devices.
*source : [wikipedia](https://en.wikipedia.org/wiki/Bluetooth)*

[^2]: Inertial Measurement Unit. Electronic device that measures and reports the movement of it. It can be used to report translation or rotation movements.
*source : [wikipedia](https://en.wikipedia.org/wiki/Inertial_measurement_unit)*

[^3]: Subscriber Identity Module. Integrated circuit intended to securely store an international mobile subscriber identity (IMSI) number, which are used to identify subscribers on mobile telephone devices.
*source : [wikipedia](https://en.wikipedia.org/wiki/SIM_card)*

[^4]: Global Positioning System. Satellite-based radio navigation system that provide geo-location and time information to a GPS receiver.
*source : [wikipedia](https://en.wikipedia.org/wiki/Global_Positioning_System)*

[^5]: An electromagnet is a type of magnet in which the magnetic field is produced by an electric current.
*source : [wikipedia](https://en.wikipedia.org/wiki/Electromagnet)*

[^6]: Used to connect or "wire" components to one another in a circuit.
*source : [wikipedia](https://en.wikipedia.org/wiki/Printed_circuit_board)*