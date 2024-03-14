
# faciltateur_de_vies


# Project Description 

- A mobile application with two profiles: Easer and Client.

- The customer is looking for a mobile solution to connect clients and easers.

- The client will be able to choose between two types of subscriptions: Classic or Premium or pay per service.

- Customers will be able to order services online.

- The services will be divided into several categories.

- Customers will be able to follow up on the services (agenda, evaluation, payment...etc).

- The easers and the admin will receive the service requests directly via the tool.

- A check-in system via RFID badge (on arrival and departure).

- The easer and admin will have access to the follow-up of services and statistics.

- Customers and Easer will have several means of communication (chat, mail or video).

- Back End application is controlled from Dolibarr (open source system ERP).

## Getting Started

This project is a starting point for a Flutter application.

## Build Statements

- use "flutter build appbundle" to build abb file. 
- use "flutter build apk --release" to build apk file.
- use "flutter run" to run application.

## Project information

 - This project is using clean code architecture [TDD],
 - it's using dependency injection.
 - using Dio for handling Http request from Backend. [https://pub.dev/packages/dio]
 - navigation split outside the main.
 - using provider for state-management.[https://pub.dev/packages/provider]

## Logic Flow in the application

The Flow in this application is:

 - starting from user interface an action is triggered that can be the event to the provider as a state management.
 - then the provider will trigger the right usecase that suits the event from user interface.
 - repository revive the event from usecase that was triggered by provider and move this action to api call.
 - API call handle the request coming from the above layers and return response from the backend side in the same root 
   that the request came from so the user interface will receive the changes back from these layers.
 
 
## app icon

if you need to change the icon of the application please follow these steps  :
 - add a new icon in assets folder in Project  
 - change the path in flutter_launcher_icons.yaml file 
 - then run this "flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml"

## XD design links
- Easer
https://xd.adobe.com/view/288935a0-acec-4fc8-a059-ec760c76765c-7dda/screen/399069c2-fc41-4ddc-abf0-83cd569cbfe3/

- User 
https://xd.adobe.com/view/32ee922b-02aa-4b37-ae5b-075ab7af7987-67bd/screen/f1aad970-1626-4499-8a83-6a639f3f66fb/
