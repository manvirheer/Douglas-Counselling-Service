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
            //Handle the latest event
            snapshot.forEach((doc) => {
              if (user.uid == doc.data().admin_id) {
                db.collection("admin-availability").onSnapshot((snapshot) => {
                  snapshot.forEach((docInner) => {
                    if (docInner.id == doc.data().admin_availability) {
                      var type = docInner.data().type;
                      var startDate = new Date(
                        docInner.data().startTime.toDate()
                      ).toLocaleDateString("en-US");
                      var startTime = new Date(
                        docInner.data().startTime.toDate()
                      ).toLocaleTimeString("en-US");
                      var finishDate = new Date(
                        docInner.data().finishTime.toDate()
                      ).toLocaleDateString("en-US");
                      var finishTime = new Date(
                        docInner.data().finishTime.toDate()
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
                          table.innerHTML += `<tr>
                        <td>${type}</td>
                        <td>
                            <p class="h4">${startDate} at ${startTime} - ${finishTime}</p>
                        </td>
                        <td>${name}</td>
                        <td><a href="createChat.html?studentID=${studID}&adminID=${user.uid}&meetingID=${doc.id}">BUTTON<a></td>
                    </tr>`;
                        });
                    }
                  });
                });
              }
            });
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
          startTime: Date.parse(startTime) / 1000,
          finishTime: Date.parse(finishTime) / 1000,
          counsellorZoomLink,
        })
        .then(function (docRef) {
          console.log("Document written with ID: ", docRef.id);
        })
        .catch(function (error) {
          console.error("Error adding document: ", error);
        });
    });
  } else {
    console.log("User logged out - No user in admin portal");
  }
});

const logoutBtn = document.querySelector("#logoutBtn");

logoutBtn.addEventListener("click", function (e) {
  e.preventDefault();
  auth.signOut();
  window.open("index.html", "_self");
});

//Admin Sign Up Form
const signUpform = document.querySelector("#add-form");
signUpform.addEventListener("submit", (e) => {
  e.preventDefault();

  //get user info
  const firstName = signUpform["signUpFirstName"].value;
  const lastName = signUpform["signUpLastName"].value;
  const phone = signUpform["signUpPhoneNumber"].value;
  const year = signUpform["signUpYear"].value;
  const email = signUpform["signInStudentEmail"].value;
  const password = signUpform["signInStudentPassword"].value;

  //SignUp for Students
  auth.createUserWithEmailAndPassword(email, password).then((cred) => {
    db.collection("admins")
      .doc(cred.user.uid)
      .set({
        firstName,
        lastName,
        uid: cred.user.uid,
        year,
        phone,
        email,
        joinDate: new Date().getTime(),
      })
      .then(() => {
        $("#signUpModal").modal("hide");
        signUpform.reset();
      });
  });
});
