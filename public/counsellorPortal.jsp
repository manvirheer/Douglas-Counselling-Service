<!Doctype html>
<html lang="en">

<head>
    <title>Counsellor Portal</title>
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
                <a href="index.jsp" class="navbar-brand d-inline-flex " id="counsellorGreetings">Welcome
                    <!-- <i class="material-icons ml-2" aria-hidden="true">show_chart</i> -->
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                    aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse text-uppercase" id="navbarContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item top-pad">
                            <a type="button" class="nav-link" data-toggle="modal" data-target="#addModal">Add Counsellor</a>
                        </li>
                        <li class="nav-item">
                            <i class="material-icons nav-link" aria-hidden="true"  data-toggle="modal" data-target="#profileModal">person_outline</i>
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

    <!-- Add a New Counsellor -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="signInModalTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary text-black" id="signInModalTitle">Add New Counsellor</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method='GET' action='counsellorPortal.jsp' >
                    <!-- id="add-form" -->
                        <div class="form-group">
                            <label for="signUpFirstName">First Name</label>
                            <input class="form-control" type="text" id="signUpFirstName" name="signUpFirstName"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="signUpLastName">Last Name</label>
                            <input class="form-control" type="text" id="signUpLastName" name="signUpLastName" required>
                        </div>
                        <div class="form-group">
                            <label for="signUpPhoneNumber">Phone Number</label>
                            <input type="text" class="form-control" id="signUpPhoneNumber" name="signUpPhoneNumber"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="signUpYear">Experience</label>
                            <input type="text" class="form-control" id="signUpYear" name="signUpYear"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="signInStudentEmail">Email address</label>
                            <input type="email" class="form-control" id="signInStudentEmail" name="signInStudentEmail"
                                aria-describedby="emailHelp" required>
                            <small id="signIn-emailHelp" class="form-text text-muted">We'll never share your email with
                                anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="studentPassword">Password</label>
                            <input type="password" class="form-control" id="signInStudentPassword"
                                name="signInStudentPassword" required>
                        </div>
                        
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <!-- <button type="submit" class="btn btn-primary">Submit</button> -->
                    <input type="submit" class="btn btn-primary" name='signUp' value='Submit'>
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
                    <p class="font-sans lead mb-1 text-secondary">Future Booked Appointments by Students</p>
                </div>
            </div>
            <hr class="border-1 border-white my-7 ml-0 text-left w-65" role="presentation">

            <!-- <a href="https://themes.getbootstrap.com/product/focus/" class="btn btn-primary">Purchase - $39</a> -->

            <table class="table table-responsive-md" >
                <thead>
                    <tr>
                        <th>Type</th>
                        <th>Time</th>
                        <th>Student ID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="tbl-bookedAp">
                   
            </table>

        </div>
            <div class="bg-primary text-dark text-center">
            <div class="container py-4">
                <p class="font-sans lead mb-3">Click Here to Add a New Availability</p>
                <form id="availability-form">
                    <div class="form-group">
                        <label for="signInStudentEmail">Start Time</label>
                        <input type="datetime-local" class="form-control" id="startTimeid" name="startTimeid"
                            aria-describedby="emailHelp" required>
                      
                    </div>
                    <div class="form-group">
                        <label for="signInStudentEmail">Finish Time</label>
                        <input type="datetime-local" class="form-control" id="finishTimeid" name="finishTimeid"
                            aria-describedby="emailHelp" required>
                      
                    </div>

                    <div class="form-group">
                        <label for="counsellorZoomLink">Zoom Link</label>
                        <input type="text" class="form-control" id="counsellorZoomLink" name="counsellorZoomLink"
                            >
                      
                    </div>
                                 
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" id="chat" value="Chat" checked>
                        <label class="form-check-label" for="exampleRadios1">
                         Chat
                        </label> &nbsp;&nbsp;&nbsp;
                        <input class="form-check-input" type="radio" name="type" id="video" value="Video">
                        <label class="form-check-label" for="exampleRadios2">
                         Video
                        </label>
                      
                    </div>
            </div>
            <div class="modal-footer container py-4 ml-auto "  style="margin:40 auto;">
                <button type="submit" class="center btn btn-outline-dark btn-primary">Submit</button>
                
            </div>
            </form>
            </div>
            <!-- Testimonials -->
            <!-- <div class="bg-white text-black">
            <div class="container py-6">
                <h2 class="h3 text-center mb-5">What people are saying…</h2>
                <div class="row">
                    <div class="col-md">
                        <blockquote class="text-center mb-5 mb-sm-0">
                            <img src="assets/img/tim-schoch.jpg" class="avatar avatar-lg mb-3" alt="Tim Schoch">
                            <cite class="d-block h5 mb-1">Tim Schoch</cite>
                            <span class="small text-muted text-uppercase">Designer</span>
                            <p class="quote text-muted mt-3 mb-0">Focus theme is great. It really saves me time and
                                effort. Thank you so much for your help</p>
                        </blockquote>
                    </div>
                    <div class="col-md">
                        <blockquote class="text-center mb-5 mb-md-0">
                            <img src="assets/img/olive-mathews.jpg" class="avatar avatar-lg mb-3" alt="Olive Mathews">
                            <cite class="d-block h5 mb-1">Olive Mathews</cite>
                            <span class="small text-muted text-uppercase">Photographer</span>
                            <p class="quote text-muted mt-3 mb-0">Focus is great. I will refer everyone I know. This
                                theme is worth much more than I paid. I'm loving it.</p>
                        </blockquote>
                    </div>

                    <div class="col-md">
                        <blockquote class="text-center">
                            <img src="assets/img/malan-alankara.jpg" class="avatar avatar-lg mb-3" alt="Malan Alankara">
                            <cite class="d-block h5 mb-1">Malan Alankara</cite>
                            <span class="small text-muted text-uppercase">Architect</span>
                            <p class="quote text-muted mt-3 mb-0">Not able to tell you how happy I am with Focus. It's
                                exactly what I've been looking for.</p>
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-primary text-dark text-center">
            <div class="container py-6">
                <h2 class="font-sans-serif">Focus is mobile-ready, flexible and cross-browser</h2>
                <p class="lead mb-4">Impress your audiences with memorable pages that showcase your works</p>
                <a href="https://themes.getbootstrap.com/product/focus/" class="btn btn-outline-dark">Buy now</a>
            </div>
        </div> -->
    </main>

    <footer class="bg-white text-dark">
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
    </footer>
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

    <script src="scripts/counsellorPortal.js"></script>
    <%
    if ("GET".equalsIgnoreCase(request.getMethod())&&request.getParameter("signUp")!=null) {

       String fname = request.getParameter("signUpFirstName");
       String lname = request.getParameter("signUpLastName");
       String phoneNumber = request.getParameter("signUpPhoneNumber");
       String year = request.getParameter("signUpYear");
       String email = request.getParameter("signInStudentEmail");
       String password = request.getParameter("signInStudentPassword");

       %>
       <script>AddCounsellor('<%= fname%>','<%= lname%>','<%= phoneNumber%>','<%= year%>','<%= email%>','<%= password%>');</script>
       <%
    }
   %>
</body>
</html>