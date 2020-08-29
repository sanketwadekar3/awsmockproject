exports.handler = (event, context, callback) => {
    console.log ("Trigger function =", event.triggerSource);

    if (event.request.userAttributes.email.endsWith('@quantiphi.com')) {
            console.log ("Authentication successful: ", event.request);
            callback(null, event);
    } else {
        console.log ("Authentication failed: ", event.request);
        callback("Please Signup using your Quantiphi Email-Id", event)
    }

};
