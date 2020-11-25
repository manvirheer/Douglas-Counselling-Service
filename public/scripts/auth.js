
//Student Sign Up
const signUpform = document.querySelector('#signUp-form');
signUpform.addEventListener('submit', (e) => {
    e.preventDefault()

    //get user info
    const firstName = signUpform['signUpFirstName'].value;
    const lastName = signUpform['signUpLastName'].value;
    const id = signUpform['signUpStudentID'].value;
    const email = signUpform['signUpStudentEmail'].value;
    const password = signUpform['signUpStudentPassword'].value;

    //SignUp for Students
    auth.createUserWithEmailAndPassword(email, password).then(cred => {
        db.collection('students').doc(cred.user.uid).set({
            firstName,
            lastName,
            uid: cred.user.uid,
            id,
            email,
            joinDate: (new Date()).getTime()
          }).then(() => {
            $('#signUpModal').modal('hide');
            signUpform.reset();
            window.open("http://127.0.0.1:5500/public/studentPortal.html");
            
        });
});
});

const adminSignInForm = document.querySelector("#adminSignIn-form");
adminSignInForm.addEventListener('submit', (e) => {
    e.preventDefault()
    const email = adminSignInForm['adminSignInEmail'].value;
    const password = adminSignInForm['adminSignInPassword'].value;

    auth.signInWithEmailAndPassword(email, password).then(cred => {
        console.log('cred')
        console.log(cred)
        console.log('cred.user')
        console.log(cred.user);
        db.collection("admins").where("uid", "==", cred.user.uid)
            .get()
            .then(function (querySnapshot) {
                querySnapshot.forEach(function (doc) {
                    // doc.data() is never undefined for query doc snapshots
                    console.log(doc.id, " => ", doc.data());

                });
            })
        $('#signInModal').modal('hide');

        signInForm.reset();
    });


});



//Student Sign In form
const signInForm = document.querySelector('#signIn-form');
signInForm.addEventListener('submit', (e) => {
    e.preventDefault()
    const email = signInForm['signInStudentEmail'].value;
    const password = signInForm['signInStudentPassword'].value;

    auth.signInWithEmailAndPassword(email, password).then(cred => {
        console.log('cred')
        console.log(cred)
        console.log('cred.user')
        console.log(cred.user);
        db.collection("users").where("uid", "==", cred.user.uid)
            .get()
            .then(function (querySnapshot) {
                querySnapshot.forEach(function (doc) {
                    // doc.data() is never undefined for query doc snapshots
                    console.log(doc.id, " => ", doc.data());

                });
            })
        $('#signInModal').modal('hide');

        signInForm.reset();
    });


});


function userSignIn() {
    $('#signUpModal1').parent().hide();
    $('#signInModal1').parent().hide();
    $('#logoutBtn1').parent().show();
    if (Cookies.get('userType') == 'Student') {
        $('#bookAppointment1').parent().show();
        $('#provideAvailability1').parent().hide();
    }
    else if (Cookies.get('userType') == 'Admin') {
        $('#bookAppointment1').parent().hide();
        $('#provideAvailability1').parent().show();
    }
}


function userSignOut() {
    $('#signUpModal1').parent().show();
    $('#signInModal1').parent().show();
    $('#logoutBtn1').parent().hide();
    $('#bookAppointment1').parent().hide();
    $('#provideAvailability1').parent().hide();
}

function loginLogout() {
    if (Cookies.get('email') == undefined)
        userSignOut();
    else
        userSignIn();
}
