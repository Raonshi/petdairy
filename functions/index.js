const functions = require("firebase-functions");
const admin = require("firebase-admin");
const serviceAccount = require("./serviceAccount.json");


admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
})

exports.enableNotifications = functions.firestore.document('pets/{userId}').onUpdate((change, context) => {
    const changedData = change.after.data();
});

exports.enableNotification = functions.https.onCall((data, context) => {
    console.log(`Enable Notification : ${data}`);

    const registrationToken = data;

    const message = {
        data: {
            score: '850',
            time: '2:45'
        },
        token: registrationToken
    };

    // Send a message to the device corresponding to the provided
    // registration token.
    const defaultMessaging = admin.messaging();
    defaultMessaging.send(message).then((response) => {
        // Response is a message ID string.
        console.log('Successfully sent message:', response);
    }).catch((error) => {
        console.log('Error sending message:', error);
    });
});
