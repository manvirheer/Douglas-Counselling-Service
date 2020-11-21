//add admin cloud function


// auth.onAuthStateChanged(user => {
//     if (user) {
//       db.collection('guides').onSnapshot(snapshot => {
//         setupGuides(snapshot.docs);
//         setupUI(user);
//       },err =>{
//         console.log(err.message)
//       });
//     } else {
//       setupUI();
//       setupGuides([]);
//     }
//   });

const signUpform = document.querySelector('#signUp-form');
signUpform.addEventListener('submit', (e)=>{
    e.preventDefault()

    //get user info
    const name = signUpform['signUpStudentName'].value;
    const id = signUpform['signUpStudentID'].value;
    const email = signUpform['signUpStudentEmail'].value;
    const password = signUpform['signUpStudentPassword'].value;
     
    console.log(name, id, email, password);

    //signup user
    auth.createUserWithEmailAndPassword(email,password).then(cred =>{
        //console.log(cred.user)

        const modal = document.querySelector('#signUpModal');
        M.Modal.getInstance(modal).close();
        signUpform.reset();

    });
});

//logout

const logoutBtn = document.querySelector("#logoutBtn");

logoutBtn.addEventListener('click', (e) =>{
    e.preventDefault();
    auth.signOut().then(()=>{
        console.log('user signed out');
    });
});


//signIn form

const signInForm = document.querySelector('#signIn-form');
signInForm.addEventListener('submit', (e)=>{
    e.preventDefault()
    const email = signInForm['signInStudentEmail'].value;
    const password = signInForm['signInStudentPassword'].value;

    auth.signInEmailAndPassword(email,password).then(cred =>{
        console.log(cred.user)

        const modal = document.querySelector('#signInModal');
        M.Modal.getInstance(modal).close();
        signInForm.reset();

    });
});