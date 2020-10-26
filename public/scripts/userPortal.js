auth.onAuthStateChanged(user => {
    if (user) {
        //  console.log("User logged in: ", user)
        console.log(user.uid)
        db.collection('students').doc(user.uid).get().then(function (doc) {
            if (doc.exists) {
                console.log("Document data:", doc.data().studentName);
                const studentGreetings = document.querySelector("#studentGreetings");
                studentGreetings.innerHTML = "Welcome, " + doc.data().studentName + "!";
            } else {
                // doc.data() will be undefined in this case
                console.log("No such document!");
            }
        }).catch(function (error) {
            console.log("Error getting document:", error);
        });
    }
    else {
        console.log("User logged out")
    }
});

const logoutBtn = document.querySelector("#logoutBtn");

logoutBtn.addEventListener("click", function (e) {
    e.preventDefault();
    auth.signOut();
})