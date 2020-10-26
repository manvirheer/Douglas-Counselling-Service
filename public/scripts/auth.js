const loginForm = document.querySelector('#signIn-form');
const logout = document.querySelector('#logout');
const signUpForm = document.querySelector("#signUp-form");

const password = loginForm['signInStudentPassword'].value;
console.log(password)
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
    const email = signUpForm['signUpStudentEmail'].value;
    const password = signUpForm['signUpStudentPassword'].value;
    console.log(email + password)

    auth.createUserWithEmailAndPassword(email, password).then(cred => {
        console.log("Created -> ", cred);

        // Closing the signup modal & reset form
        
    });
})


// // logout
// logout.addEventListener('click', (e) => {
//     e.preventDefault();
//     auth.signOut().then(() => {
//         //Promise 

//     })
// });


// login
loginForm.addEventListener('submit', (e) => {
    e.preventDefault();

    // get user info
    const email = loginForm['signInStudentEmail'].value;
    const password = loginForm['signInStudentPassword'].value;
    console.log(email + password)
    // log the user in
    auth.signInWithEmailAndPassword(email, password).then((cred) => {
        // close the signup modal & reset form
       
    });
});
