**Firebase Project Id: beta-testing-1eeaf**
## Steps:
- 1- Create a Project on Firebase.
- 2- Add It to your flutter project using CLI
    - `dart pub global activate flutterfire_cli`
    - `flutterfire configure --project=beta-testing-1eeaf`
- 3- Add `firebase_core` package to pubspec.yaml.
- 4- build your apk `flutter build apk`.
- 5- In Firebase Console choose `App Distribution` then upload your apk.
- 6- Select Your Testers & Groups and Whrite your release note then click Distribute to testers.
- 7- The Testers will recieve an invitation via email to test the app.
- 8- When a Tester click 'Get Started' from the invitation a web page will open asking the user to accept the invitation.
- 9- A message says 'Get the Firebase App Tester app' will apear, click 'Download App Tester'.
- 10- Open the app and login with the tester account.
- 11- Now you can see the release version that you aploaded to firebase and you can download it.