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
    const userType = signUpform['userType'].value;
     
    console.log(name, id, email, password);

    //signup user
    auth.createUserWithEmailAndPassword(email,password).then(cred =>{
        console.log(cred.user)
        console.log(cred.user.uid)

        // const modal = document.querySelector('#signUpModal');
        // M.Modal.getInstance(modal).close();

        const user = {
            name: name,
            uid: cred.user.uid,
            userType: userType
          }

          db.collection('users').add(user)
          .then(() => {
            $('#signUpModal').modal('hide');
            signUpform.reset();
        });

    });
});

//logout

const logoutBtn = document.querySelector("#logoutBtn1");

logoutBtn.addEventListener('click', (e) =>{
    e.preventDefault();
    auth.signOut().then(()=>{
        console.log('user signed out');
        Cookies.remove('email');
        Cookies.remove('userType');
        userSignOut();
        
    });
});


//signIn form

const signInForm = document.querySelector('#signIn-form');
signInForm.addEventListener('submit', (e)=>{
    e.preventDefault()
    const email = signInForm['signInStudentEmail'].value;
    const password = signInForm['signInStudentPassword'].value;

    auth.signInWithEmailAndPassword(email, password).then(cred =>{
        console.log('cred')
        console.log(cred)
        console.log('cred.user')
        console.log(cred.user)

        Cookies.set('email', email);

        db.collection("users").where("uid", "==", cred.user.uid)
        .get()
        .then(function(querySnapshot) {
            querySnapshot.forEach(function(doc) {
                // doc.data() is never undefined for query doc snapshots
                console.log(doc.id, " => ", doc.data());
                Cookies.set('userType', doc.data().userType);

                userSignIn();         
            });
        })

        // const modal = document.querySelector('#signInModal');
        // //M.Modal.getInstance(modal).close();
        // console.log(modal);
        $('#signInModal').modal('hide');

        signInForm.reset();
    });


});


function userSignIn(){
    $('#signUpModal1').parent().hide();
    $('#signInModal1').parent().hide();
    $('#logoutBtn1').parent().show();
    if(Cookies.get('userType') == 'Student'){
        $('#bookAppointment1').parent().show();
        $('#provideAvailability1').parent().hide();
    }
    else if(Cookies.get('userType') == 'Admin'){
        $('#bookAppointment1').parent().hide();    
        $('#provideAvailability1').parent().show();    
    }           
}


function userSignOut(){
    $('#signUpModal1').parent().show();
    $('#signInModal1').parent().show();
    $('#logoutBtn1').parent().hide();
    $('#bookAppointment1').parent().hide();
    $('#provideAvailability1').parent().hide();
}

function loginLogout(){
    if(Cookies.get('email') == undefined)
    userSignOut();
    else
    userSignIn();
}
loginLogout();