var roomIDGloball = window.localStorage.getItem("roomIDGlobal");
var roomEmailStudentGloball = window.localStorage.getItem("roomEmailStudentGlobal");
var sp = (window.location.href).split("?")[1].split("&");
//console.log(sp[0].split("=")[1]);
console.log(sp)
var s1 = sp[0].split("=")[1];
var s2 = sp[1].split("=")[1];
var s3 =sp[2].split("=")[1];
console.log(s3);
console.log("hey");
//console.log(sp[1].split("=")[1]);
//console.log(sp[2].split("=")[1]);
var getStatus = "0";
db.collection("student-bookings").doc(s3).get().then(function(doc) {
    if (doc.exists) {
        getStatus = doc.data().status;
    } else {
        // doc.data() will be undefined in this case
        console.log("No such document!");
    }
}).catch(function(error) {
    console.log("Error getting document:", error);
});
if (getStatus =="1"){db.collection("student-bookings").doc(s3).update({
    "status" : "2"
})} 
if (getStatus =="0"){db.collection("student-bookings").doc(s3).update({
    "status" : "1"
})} 

var currentUserID = window.localStorage.getItem("userID");
console.log(roomEmailStudentGloball);
console.log(currentUserID);
var dbmessage = db.collection('messages').doc(s1).collection(s3); 
auth.onAuthStateChanged(user => {
    if (user) {
        console.log("s2 equal"+s2);
        console.log(user.uid);
        if (s2== user.uid) $("a#portalCreateChat").attr("href","counsellorPortal.jsp");
        if (s2== user.uid) $("a#portalCreateChat").attr("text","Close Chat");
        console.log("User logged in: ", user)
        console.log(user.uid)
        // Whenever the Database changes Display new message
        dbmessage.onSnapshot(function (snapshot) {
            snapshot.docChanges().forEach(function(change) {
                if (change.type === "added") {
                    var html = "";
                    console.log("user id"+user.uid);
                    console.log("sender"+change.doc.data().sender);
                    var senderName = "";
                    // If it is the user text appear on the right
                    if (change.doc.data().sender == user.uid) {
                        var senderID = change.doc.data().sender;
                        db.collection("students")
                        .doc(senderID)
                        .get()
                        .then(function (docColl) {
                            if (docColl.exists){
                                senderName = docColl.data().firstName
                                console.log(docColl.data().firstName)
                            }
                            else{
                                console.log("counldn't find the user")
                            }
                        }
                        );
                        console.log("Name should be -> " + senderName)
                        html += "<li id='message-" + snapshot.key  +  
                                "' style='background-color:#ff9285;"
                                        +"float:right;color:white; clear:both;"
                                        +"padding:7px; border-radius:12px;"
                                        +"margin:2px;"
                                        +"text-overflow: ellipsis;"
                                        +"max-width:70%;"
                                        +"'>";
                        html += change.doc.data().senderName + ": " + change.doc.data().message;
                        html += "</li>"; 
                    } 
                    // If it is not the user text appear on the left
                    else {
                        html += "<li id='message-" + snapshot.key  +  
                                "' style='background-color:white;"
                                +"float:left;color:black; clear:both;"
                                +"padding:7px; border-radius:12px;"
                                +"margin:2px;"
                                +"text-overflow: ellipsis;"
                                +"max-width:70%;"
                                +"'>";
                        html += change.doc.data().senderName + ": " + change.doc.data().message;
                        html += "</li>"; 
                    }
                    // Change dynamic chat display
                    document.getElementById("chatmessagedisplay").innerHTML += html;
                    // Scroll bar to the latest element
                    var getst = document.getElementById("chatdisplaydiv");
                    getst.scrollTop = getst.scrollHeight;
                }
            });
        });
    }
    else {
        console.log("User logged out")
    }
});

// Update Message to Database  
function sendMessage() {
    // get message
    var message = document.getElementById("chatmessage").value;
    console.log(message);
    currentUserID = window.localStorage.getItem("userID");
    db.collection("students")
    .doc(currentUserID)
    .get()
    .then(function (docInner) {
      if (docInner.exists) {
          currentUserName = docInner.data().firstName
          console.log(currentUserName  +  "jhfak");
          db.collection('messages').doc(s1).collection(s3).add({
      
              "sender": currentUserID,
              "message": message,
              "senderName" : currentUserName
          });
      }}
    );
    db.collection("admins")
    .doc(currentUserID)
    .get()
    .then(function (docInner) {
      if (docInner.exists) {
          currentUserName = docInner.data().firstName
          console.log(currentUserName  +  "jhfak");
          db.collection('messages').doc(s1).collection(s3).add({
      
              "sender": currentUserID,
              "message": message,
              "senderName" : currentUserName
              
          });
      }}
    );

    // save in database
    document.getElementById("chatmessage").value = "";
    // prevent form from submitting
    return false;
}; 
function endChat(){
    db.collection("student-bookings").doc(s3).update({
        "status" : "2"
    })

    var message = "Ended the chat!!!! Please return to homepage. ";
    console.log(message);
    currentUserID = window.localStorage.getItem("userID");
    db.collection("students")
    .doc(currentUserID)
    .get()
    .then(function (docInner) {
      if (docInner.exists) {
          currentUserName = docInner.data().firstName
          console.log(currentUserName  +  "jhfak");
          db.collection('messages').doc(s1).collection(s3).add({
      
              "sender": currentUserID,
              "message": message,
              "senderName" : currentUserName
          });
      }}
    );
    db.collection("admins")
    .doc(currentUserID)
    .get()
    .then(function (docInner) {
      if (docInner.exists) {
          currentUserName = docInner.data().firstName
          console.log(currentUserName  +  "jhfak");
          db.collection('messages').doc(s1).collection(s3).add({
      
              "sender": currentUserID,
              "message": message,
              "senderName" : currentUserName
              
          });
      }}
    );

}