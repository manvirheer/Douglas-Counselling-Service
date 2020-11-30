// the Zoom link has to be the admin's personal Zoom Link
// we can get this from the admin itself
// note: get the zoom link from your profile so change the dafault link below
const ZOOM_LINK = "https://us04web.zoom.us/profile";

auth.onAuthStateChanged((user) => {
  if (user) {
    //  console.log("User logged in: ", user)
    console.log("Logged In user ID -> " + user.uid);
    db.collection("students")
      .doc(user.uid)
      .get()
      .then(function (doc) {
        if (doc.exists) {
          console.log("Document data:", doc.data().firstName);
          const studentGreetings = document.querySelector("#studentGreetings");
          studentGreetings.innerHTML = "Welcome, " + doc.data().firstName + "!";

          db.collection("student-bookings").onSnapshot((snapshot) => {
            var table = document.querySelector("#tbl-bookedAp");
            //Handle the latest event
            snapshot.forEach((doc) => {
              console.log("hi");
              //console.log(doc.data())
              //console.log(`User ID = ${user.uid} ${doc.data().student_id}`);
              //console.log("bruh")
              if (user.uid == doc.data().student_id) {
                db.collection("admin-availability").onSnapshot((snapshot) => {
                  snapshot.forEach((docInner) => {
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
                      const counsellorZoomLink = docInner.data()
                        .counsellorZoomLink;
                      db.collection("admins")
                        .doc(docInner.data().admin_id)
                        .get()
                        .then((docSpec) => {
                          var name = docSpec.data().firstName;
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
                          console.log(doc.id);

                          window.localStorage.setItem("userID", varr);
                          console.log(window.localStorage.getItem("userID"));
                          window.localStorage.setItem(
                            "roomEmailStudentGlobal",
                            user.uid
                          );

                          let href;
                          if (type.toUpperCase() === "CHAT") {
                            href = `createChat.html?studentID=${user.uid}&adminID=${docSpec.id}&meetingID=${doc.id}`;
                          } else {
                            if (counsellorZoomLink.includes("zoom.us/")) {
                              href = counsellorZoomLink;
                            } else {
                              href = ZOOM_LINK;
                            }
                          }

                          table.innerHTML += `<tr>
                                            <td>${type}</td>
                                            <td>
                                                <p class="h4">${startDate} at ${startTime} - ${finishTime}</p>
                                            </td>
                                            <td>Dr. ${name}</td>
                                            <td><a href="${href}">BUTTON<a></td>
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
  } else {
    console.log("User logged out - No user in student portal");
  }
});

const logoutBtn = document.querySelector("#logoutBtn");

logoutBtn.addEventListener("click", function (e) {
  e.preventDefault();
  auth.signOut();
});
