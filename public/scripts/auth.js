//Student Sign Up Form
//const signUpform = document.querySelector('#signUp-form');

//called signUp function from index.jsp
function signUp(firstName,lastName,id,email,password) {
	console.log('working',id);
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
           // signUpform.reset();
            window.open("studentPortal.jsp",'_self');
            
        });
	});
}

//Counsellor Sign In
const adminSignInForm = document.querySelector("#adminSignIn-form");
adminSignInForm.addEventListener('submit', (e) => {
    e.preventDefault()
    const email = adminSignInForm['adminSignInEmail'].value;
    const password = adminSignInForm['adminSignInPassword'].value;

    auth.signInWithEmailAndPassword(email, password).then(cred => {
        db.collection("admins").where("uid", "==", cred.user.uid)
            .get()
            .then(function (querySnapshot) {
                querySnapshot.forEach(function (doc) {
                    // doc.data() is never undefined for query doc snapshots
                    console.log(doc.id, " => ", doc.data());
                });
                window.open("counsellorPortal.jsp", "_self")
            })
        $('#signInModal').modal('hide');
        adminSignInForm.reset();
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
                // querySnapshot.forEach(function (doc) {
                //     // doc.data() is never undefined for query doc snapshots
                //     console.log(doc.id, " => ", doc.data());
                // });
                window.open("studentPortal.jsp", "_self");
            })
        $('#signInModal').modal('hide');

        signInForm.reset();
    });


});


    


