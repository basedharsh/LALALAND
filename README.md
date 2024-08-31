

# Flutter Firebase Goodies Shopping App

Welcome to the Flutter Firebase Goodies Shopping App! This app showcases an exciting e-commerce platform built using Flutter and Firebase, with multiple user flows: Guest, Buyer, Seller, and Admin. Follow the instructions below to set up the project and explore its features.

## Getting Started

### 1. Add the Android Folder



- **Generate the Android Folder in Your Existing Project**
  
 In your main project directory, you can directly create the `android` folder by running:
  ```bash
  flutter create .
  ```

### 2. Firebase Setup

To use Firebase features in your app, you need to configure Firebase by following one of these options:

1. **Add `firebase.json` file**: Download the `firebase.json` configuration file from the Firebase console and place it in the root directory of your project or Use Firebase Cli and configure accordingly.

2. **Use Firebase Emulator**: To set up the Firebase Emulator for local testing:

    - Install the Firebase CLI if you haven't already:
      ```bash
      npm install -g firebase-tools
      ```

    - Initialize Firebase in your project:
      ```bash
      firebase init
      ```

    - Start the Firebase Emulator:
      ```bash
      firebase emulators:start --import=./emulator-data
      ```

   - This must start the firebase emulator with such  visbile output:
<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/user-attachments/assets/b31e2355-6628-415a-84fc-d6019940bf1e" style="width: 48%; height: 50%;" />
  <img src="https://github.com/user-attachments/assets/b054e7ce-a177-4605-9c05-6d0e83acb48e" style="width: 48%; height: 50%;" />
</div>




- **Test the App**: Open the app and interact with it to test different user flows while connected to the local emulator.
- Note: just make  sure to keep that particular port free or change the port number from firebase,json


The emulator allows you to simulate Firebase services locally, such as Firestore, Authentication, and more.

## User Flows

The app includes four distinct user flows:

1. **Guest**: Explore the app without logging in. Guests can browse products, view product details, and see limited features.

   ![Guest Flow](images/guest-flow.png)

2. **Buyer**: Registered users who can add products to their cart, make purchases, and track orders.

   ![Buyer Flow](images/buyer-flow.png)

3. **Seller**: Users who can list products for sale, manage inventory, and fulfill orders.

   ![Seller Flow](images/seller-flow.png)

4. **Admin**: Admins have access to manage users, oversee transactions, and monitor app activities.

   ![Admin Flow](images/admin-flow.png)



### Optional: Use Your Data or Start Fresh

To run the app with your data using the Firebase Emulator, or to set up a fresh Firebase project:

- **Option A: Use Emulator with Your Data**
  - If you have a pre-existing set of data you want to use, you can import it by running:
    ```bash
    firebase emulators:start --import=./emulator-data
    ```
  - Make sure your data files are in the `./emulator-data` directory to be loaded by the emulator.

- **Option B: Set Up a Fresh Firebase Project**
  - If you prefer to set up a fresh Firebase project:
    1. Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.
    2. Add your desired Firebase services (Firestore, Authentication, etc.).
    3. Download the `google-services.json` file and place it in the `android/app` directory.
    4. Manually add initial data to your Firebase project using the Firebase Console.

## Screenshots

Include images of different screens and user flows to provide a visual overview of the app. Add screenshots to the `/images` folder and reference them accordingly in the README file.

## Contributing

If you want to contribute to this project, please fork the repository and submit a pull request. For any questions, feel free to open an issue.

## License

This project is licensed under the MIT License.

---

Feel free to adjust further or add more specific details as needed!
