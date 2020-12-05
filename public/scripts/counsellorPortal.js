auth.onAuthStateChanged((user) => {
  if (user) {
    //  console.log("User logged in: ", user)
    console.log("Logged In user ID -> " + user.uid);
    db.collection("admins")
      .doc(user.uid)
      .get()
      .then(function (doc) {
        if (doc.exists) {
          console.log("Document data:", doc.data().firstName);
          const counsellorGreetings = document.querySelector(
            "#counsellorGreetings"
          );
          counsellorGreetings.innerHTML =
            "Welcome, " + doc.data().firstName + "!";

          db.collection("student-bookings").onSnapshot((snapshot) => {
            var table = document.querySelector("#tbl-bookedAp");
            document.querySelector("#tbl-bookedAp").innerHTML = '';
            console.log("Reset table");
            if (table.innerHTML =="") console.log("Reset success");
            while (table.innerHTML==''){
            //Handle the latest event
            if (table.innerHTML=="") console.log("call from st-bookings");
            else console.log("table not empty call from st-bookings ");
            table.innerHTML+=`<p></p>`;
            snapshot.forEach((doc) => {
              if ((user.uid == doc.data().admin_id) &&(doc.data().status =="0")) {
                db.collection("admin-availability").where("admin_id","==",user.uid).get().then(function (querySnapshot){
                  console.log("call from ad-avai");
                  querySnapshot.forEach((docInner) => {
                    if (docInner.id == doc.data().admin_availability) {
                      var type = docInner.data().type;
                      var startDate = new Date(
                        docInner.data().startTime
                      ).toLocaleDateString("en-US");
                      var startTime = new Date(
                        docInner.data().startTime
                      ).toLocaleTimeString("en-US");
                      var finishDate = new Date(
                        docInner.data().finishTime
                      ).toLocaleDateString("en-US");
                      var finishTime = new Date(
                        docInner.data().finishTime
                      ).toLocaleTimeString("en-US");
                      db.collection("students")
                        .doc(doc.data().student_id)
                        .get()
                        .then((docSpec) => {
                          console.log(doc.data().student_id);
                          var name = docSpec.data().id; //this is different from student_id, student_id is cCZIW31A3rw
                          console.log(
                            type +
                              "Time = " +
                              startTime +
                              " Time =" +
                              finishTime +
                              "Name" +
                              name
                          );
                          window.localStorage.setItem(
                            "roomIDGlobal",
                            doc.data().admin_availability
                          );
                          var varr = user.uid;
                          window.localStorage.setItem("userID", varr);
                          var studID = doc.data().student_id;
                          window.localStorage.setItem(
                            "roomEmailStudentGlobal",
                            studID
                          );
                          console.log(
                            "sid " +
                              studID +
                              "aid " +
                              user.uid +
                              "mid " +
                              doc.id
                          );
                          let href;
                          if (docInner.data().type.toUpperCase() === "CHAT") {
                            href = `createChat.jsp?studentID=${docSpec.id}&adminID=${user.uid}&meetingID=${doc.id}`;
                          } else {
                            if ((docInner.data().counsellorZoomLink.includes("zoom.us/"))) {
                              href = docInner.data().counsellorZoomLink;
                            } else {
                              href = "https:/zoom.us/test";
                            }
                          }
                          table.innerHTML += `<tr>
                        <td>${type}</td>
                        <td>
                            <p class="h4">${startDate} at ${startTime} - ${finishTime}</p>
                        </td>
                        <td>${name}</td>
                        <td><a href="${href}" onclick="joinOnclickCoun(\'${doc.id}\')">Start ${docInner.data().type}<a></td>
                    </tr>`;
                        });
                    }
                  });
                });
              }
            });
            }
          });
        } else {
          // doc.data() will be undefined in this case
          console.log("No such document!");
        }
      })
      .catch(function (error) {
        console.log("Error getting document:", error);
  });

  const timeForm = document.querySelector("#availability-form");
  timeForm.addEventListener("submit", function (e) {
    e.preventDefault();
    const startTime = document.getElementById("startTimeid").value;
    const finishTime = document.getElementById("finishTimeid").value;
    const counsellorZoomLink = document.getElementById("counsellorZoomLink")
      .value;
    const type = timeForm["type"].value;
    console.log(Date.parse(startTime) / 1000);
    console.log(startTime);
    console.log("hey");
    db.collection("admin-availability")
      .add({
        admin_id: user.uid,
        type: type,
        //startTime: Date.parse(startTime) / 1000,
        //finishTime: Date.parse(finishTime) / 1000,
        startTime: Date.parse(startTime),
        finishTime: Date.parse(finishTime),
        counsellorZoomLink,
        "booked":false
      })
      .then(function (docRef) {
        console.log("Document written with ID: ", docRef.id);
      })
      .catch(function (error) {
        console.error("Error adding document: ", error);
      });
    alert("Create Successfully !!!");
    timeForm.reset();
  });
} else {
console.log("User logged out - No user in admin portal");
}
});

const logoutBtn = document.querySelector("#logoutBtn");
logoutBtn.addEventListener("click", function (e) {
  e.preventDefault();
  auth.signOut();
  window.open("index.jsp", "_self");
});

//Admin Sign Up Form
// const signUpform = document.querySelector("#add-form");
// signUpform.addEventListener("submit", (e) => {
//   e.preventDefault();

  //get user info
  // const firstName = signUpform["signUpFirstName"].value;
  // const lastName = signUpform["signUpLastName"].value;
  // const phone = signUpform["signUpPhoneNumber"].value;
  // const year = signUpform["signUpYear"].value;
  // const email = signUpform["signInStudentEmail"].value;
  // const password = signUpform["signInStudentPassword"].value;

  //SignUp for Admins
//   auth.createUserWithEmailAndPassword(email, password).then((cred) => {
//     db.collection("admins")
//       .doc(cred.user.uid)
//       .set({
//         firstName,
//         lastName,
//         uid: cred.user.uid,
//         year,
//         phone,
//         email,
//         joinDate: new Date().getTime(),
//       })
//       .then(() => {
//         $("#signUpModal").modal("hide");
//         signUpform.reset();
//       });
//   });
// });
function AddCounsellor(firstName,lastName,phone,year,email,password){
  auth.createUserWithEmailAndPassword(email, password).then((cred) => {
    db.collection("admins")
      .doc(cred.user.uid)
      .set({
        firstName,
        lastName,
        phone,
        uid: cred.user.uid,
        year,
        email,
        joinDate: new Date().getTime(),
      })
      .then(() => {
        $("#signUpModal").modal("hide");
        // signUpform.reset();
        window.open('counsellorPortal.jsp','_self');
      });
  });

}

function joinOnclickCoun(docc){
  db.collection("student-bookings").doc(docc).update({
   "status":"1"
  })
}