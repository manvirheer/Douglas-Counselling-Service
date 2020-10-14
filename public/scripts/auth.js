console.log(db)

db.collection('guides').get().then( snapshot => {
    console.log(snapshot)
}).catch((err)=> {
    console.log(err)
});
const loginForm = document.querySelector('#login-form');
const logout = document.querySelector('#logout');
const signUpForm = document.querySelector("#signup-form");

//listen for changes
auth.onAuthStateChanged(user => {
    if(user){
        console.log("User logged in: ", user)
    }
    else{
        console.log("User logged out")
    }
});

//Signing Up
signUpForm.addEventListener("submit", (e) => {
    e.preventDefault();

    //User Info
    const email = signUpForm['signup-email'].value;
    const password = signUpForm['signup-password'].value;

    auth.createUserWithEmailAndPassword(email, password).then(cred => {
        console.log("Created -> ", cred);

        // Closing the signup modal & reset form
        const modal = document.querySelector('#modal-signup');
        M.Modal.getInstance(modal).close();
        signUpForm.reset();
    });
})


// logout
logout.addEventListener('click', (e) => {
    e.preventDefault();
    auth.signOut().then(() => {
        //Promise 

    })
});


// login
loginForm.addEventListener('submit', (e) => {
    e.preventDefault();

    // get user info
    const email = loginForm['login-email'].value;
    const password = loginForm['login-password'].value;

    // log the user in
    auth.signInWithEmailAndPassword(email, password).then((cred) => {
        // close the signup modal & reset form
        const modal = document.querySelector('#modal-login');
        M.Modal.getInstance(modal).close();
        loginForm.reset();
    });
});
