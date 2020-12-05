<!Doctype html>
<html lang="en">

<head>
    <title>Student Portal</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Goole fonts -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,600%7CFira+Sans:300,400,400i,600"
        rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> -->

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <!-- Favicon -->
    <link rel="icon" href="assets/img/icon.png" type="image/png">

    <!-- JS -->
    <script src="scripts/theme.js" defer></script>
</head>

<body>

    <header class="site-header fixed-top bg-black border-bottom border-dark">
        <a href="#content" class="sr-only sr-only-focusable">Skip to main content</a>
        <div class="container">
            <!-- Navbar -->
            <nav class="navbar main-nav navbar-expand-lg navbar-dark" aria-label="Main navigation">
                <a href="index.jsp" class="navbar-brand d-inline-flex " id="studentGreetings">Welcome
                    <!-- <i class="material-icons ml-2" aria-hidden="true">show_chart</i> -->
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                    aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse text-uppercase" id="navbarContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a type="button" class="nav-link" data-toggle="modal" data-target="#profileModal"><i
                                    class="material-icons  " aria-hidden="true">person_outline</i></a>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Profile Header -->
    <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary text-black" id="signInModalTitle">Profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <button type="button" class="btn btn-info" id="logoutBtn">Logout</button>
                </div>
                <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div> -->

            </div>
        </div>
    </div>
    <!-- Sign In Modal -->
    <div class="modal fade" id="signInModal" tabindex="-1" role="dialog" aria-labelledby="signInModalTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary text-black" id="signInModalTitle">Sign In</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="signIn-form">
                        <div class="form-group">
                            <label for="signInStudentEmail">Email address</label>
                            <input type="email" class="form-control" id="signInStudentEmail" name="signInStudentEmail"
                                aria-describedby="emailHelp" required>
                            <small id="signIn-emailHelp" class="form-text text-muted">We'll never share your email with
                                anyone
                                else.</small>
                        </div>
                        <div class="form-group">
                            <label for="studentPassword">Password</label>
                            <input type="password" class="form-control" id="signInStudentPassword"
                                name="signInStudentPassword" required>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                </form>


            </div>
        </div>
    </div>


    <main id="content">

        <!-- Hero -->
        
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-10">
                    <p class="font-sans lead mb-1 text-secondary">Booked Appointments</p>
                </div>
            </div>
            <hr class="border-1 border-white my-7 ml-0 text-left w-65" role="presentation">

            <!-- <a href="https://themes.getbootstrap.com/product/focus/" class="btn btn-primary">Purchase - $39</a> -->

            <table class="table table-responsive-md" >
                <thead>
                    <tr>
                        <th>Type</th>
                        <th>Time</th>
                        <th>Counsellor</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tbl-bookedAp">
                   
            </table>

        </div>
            <div class="bg-primary text-dark text-center">
            <div class="container py-4">
                <p class="font-sans lead mb-3">Click Here to Book New Appointments</p>
                <a href="bookAppointment.jsp" class="btn btn-outline-dark">Book Now</a>
            </div>

    </main>

    <!-- <footer class="bg-white text-dark">
        <div class="container py-5 py-md-6">
            <div class="row justify-content-md-between">
                <div class="col-4 col-md-2">
                    <h2 class="h6">About</h2>
                    <ul class="nav flex-column">
                        <li class="mb-1"><a id="adminSignInModal" type="button" class="text-muted" data-toggle="modal"
                            data-target="#adminSignInModal">Admin Portal</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Credits</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Government Guidelines</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Privacy Policy</a></li>
                    </ul>
                </div>

                <div class="col-4 col-md-2">
                    <h2 class="h6 mb-3">Social</h2>
                    <ul class="nav flex-column">
                        <li class="mb-1"><a href="#" class="text-muted">Twitter</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Instagram</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Dribbble</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Facebook</a></li>
                    </ul>
                </div>
                <div class="col-sm-12 col-md-4 mt-4 mt-md-0">
                    <h2 class="h6 mb-3">Douglas College</h2>
                    <p class="text-sans">We would like to acknowledge that Douglas College campuses, where we live,
                        learn, work and play, are located on the unceded traditional territories of the Coast Salish
                        Peoples of the QayQayt and Kwikwetlem First Nations..</p>
                </div>
            </div>
        </div>
    </footer> -->
    <jsp:include page="footer.jsp"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
    <!-- Compiled and minified JavaScript -->

    <!-- Insert these scripts at the bottom of the HTML, but before you use any Firebase services -->

    <!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/7.23.0/firebase-app.js"></script>
    <!-- Add Firebase products that you want to use -->
    <script src="https://www.gstatic.com/firebasejs/7.23.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.23.0/firebase-firestore.js"></script>
    <script>
        const firebaseConfig = {
            apiKey: "AIzaSyD1mb8-0_Vu5sZ12e-kglm_roQ3zOGGmM0",
            authDomain: "manvir-web.firebaseapp.com",
            databaseURL: "https://manvir-web.firebaseio.com",
            projectId: "manvir-web",
            messagingSenderId: "547807204803",
            appId: "1:547807204803:web:9a9649d505a1b0a5f75976",
            measurementId: "G-3Q360T2WTE"
        };
        firebase.initializeApp(firebaseConfig);

        const auth = firebase.auth();
        const db = firebase.firestore();
    //Setting no longer required /'_'/
    // db.settings( {
      //   timestampsInSnapshots:true
      // })


    </script>
    <script>
        console.log(db);
        auth.onAuthStateChanged(user => {
            if (user) {
                console.log("User logged in: ", user)
            }
            else {
                console.log("User logged out")
            }
        });


    </script>

    <script src="scripts/studentPortal.js"></script>
</body>

</html>