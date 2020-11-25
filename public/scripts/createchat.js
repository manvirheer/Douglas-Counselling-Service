var dbmessage = db.collection('messages');

// these are test variable, will be changed to dynamic when book appointment page is done
var studentEmailvar = "a@gmail.com";
var appointmentIDvar ="id1";
var appointmentTimestampvar = "2020-11-25T16:00"

// Update Message to Database  
function sendMessage() {
    // get message
    var message = document.getElementById("chatmessage").value;

    // save in database
    dbmessage.add({
        "sender": UserEmailGlobal,
        "message": message
    });
    document.getElementById("chatmessage").value = "";
    // prevent form from submitting
    return false;
}

// Create a new appointment reference to make sure that only that student and admin(s) can access
// appointmentCheck can only be "write" by admins and can be "read" when the user is admin or that exact student
onClickSetChat = () =>{
  // create a reference
  db.collection('appointmentCheck').doc(studentEmailvar).set({
    [appointmentIDvar] : appointmentTimestampvar
  });
  // create a greeting message along with the message path in database 
  // this collection can only be "read" and "write" by admins or when the user is admin or that exact student
  db.collection('messages').doc(studentEmailvar).collection(appointmentIDvar).add({
    "sender": UserEmailGlobal,
    "message": "How are you doing today?"
  });
  // change current message path to this student
  dbmessage = db.collection('messages').doc(studentEmailvar).collection(appointmentIDvar); 
}


// Get current appointment ID
onClickGetChat = () =>{
  // change this when the book part is finished
  dbmessage = db.collection('messages').doc(studentEmailvar).collection(appointmentIDvar);
}

// Whenever the Database changes Display new message
dbmessage.onSnapshot(function (snapshot) {
  snapshot.docChanges().forEach(function(change) {
        if (change.type === "added") {
          var html = "";
            // If it is the user text appear on the right
            if (change.doc.data().sender == UserEmailGlobal) {
              html += "<li id='message-" + snapshot.key  +  
                      "' style='background-color:coral;"
                              +"float:right;color:white; clear:both;"
                              +"padding:7px; border-radius:12px;"
                              +"margin:2px;"
                              +"text-overflow: ellipsis;"
                              +"max-width:70%;"
                              +"'>";
              html += change.doc.data().sender + ": " + change.doc.data().message;
              html += "</li>"; 
            } 
            // If it is not the user text appear on the left
            else {
              html += "<li id='message-" + snapshot.key  +  
                      "' style='background-color:white;"
                      +"float:left; clear:both;"
                      +"padding:7px; border-radius:12px;"
                      +"margin:2px;"
                      +"text-overflow: ellipsis;"
                      +"max-width:70%;"
                      +"'>";
              html += change.doc.data().sender + ": " + change.doc.data().message;
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