
<!doctype html>
<html lang="en">

<head>
    <title>Home - Focus Theme</title>
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
    <link rel="stylesheet" href="css/style.css">

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
                <a href="index.jsp" class="navbar-brand d-inline-flex ">Douglas College Counselling Service <i
                        class="material-icons ml-2" aria-hidden="true">show_chart</i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                    aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse text-uppercase" id="navbarContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a type="button" class="nav-link" data-toggle="modal" data-target="#signInModal">Sign-In</a>
                        </li>
                        <li class="nav-item">
                            <a type="button" class="nav-link" data-toggle="modal" data-target="#signUpModal">Sign-Up</a>
                        </li>
                </div>
            </nav>
        </div>
    </header>

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
                            <small id="signIn-emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                else.</small>
                        </div>
                        <div class="form-group">
                            <label for="studentPassword">Password</label>
                            <input type="password" class="form-control" id="signInStudentPassword" name="signInStudentPassword"
                                required>
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

    <!-- Sign up Modal 	-->
    <div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="signUpModalTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary text-black" id="signUpModalTitle">Sign Up</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form  method='GET' action='index.jsp'> //call same page
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
                            <label for="studentID">Student ID</label>
                            <input type="text" class="form-control" id="signUpStudentID" name="signUpStudentID"
                                required>
                        </div>
                        <div class="form-group">
                            <label for="studentEmail">Email address</label>
                            <input type="email" class="form-control" id="signUpStudentEmail" name="signUpStudentEmail"
                                aria-describedby="emailHelp" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                else.</small>
                        </div>
                        <div class="form-group">
                            <label for="studentPassword">Password</label>
                            <input type="password" class="form-control" id="signUpStudentPassword"
                                name="signUpStudentPassword" required>
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" name='signUp' value='Submit'>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Admin Sign In Modal -->
    <div class="modal fade" id="adminSignInModal" tabindex="-1" role="dialog" aria-labelledby="signInModalTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary text-black" id="adminSignInModalTitle">Admin Sign In</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="adminSignIn-form">
                        <div class="form-group">
                            <label for="adminSignInEmail">Email address</label>
                            <input type="email" class="form-control" id="adminSignInEmail" name="adminSignInEmail"
                                aria-describedby="emailHelp" required>
                            <small id="signIn-emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                else.</small>
                        </div>
                        <div class="form-group">
                            <label for="adminSignInPassword">Password</label>
                            <input type="password" class="form-control" id="adminSignInPassword" name="adminSignInPassword"
                                required>
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
            <h1 class="display-3 pb-2">Here to Help.</h1>
            <hr class="border-3 border-white my-4 ml-0 text-left w-25" role="presentation">
            <div class="row">
                <div class="col-lg-10">
                    <p class="font-sans lead mb-4 text-secondary">Douglas College counsellors provide free, accessible,
                        confidential and professional support to students. We provide one-to-one support and workshops
                        to help you learn skills to better handle stress, increase resilience, manage sudden personal
                        challenges, or just feel better.</p>
                </div>
            </div>
            <div class="text-center my-5">
                <a href="https://www.douglascollege.ca/student-services/student-support/counselling"
                    class="btn btn-outline-white">View More</a>
            </div>
            <!-- <a href="https://themes.getbootstrap.com/product/focus/" class="btn btn-primary">Purchase - $39</a> -->
        </div>


    </main>
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
    <script src="scripts/auth.js"></script>
		 <%
			 if ("GET".equalsIgnoreCase(request.getMethod())&&request.getParameter("signUp")!=null) {

				String fname = request.getParameter("signUpFirstName");
				String lname = request.getParameter("signUpLastName");
				String id = request.getParameter("signUpStudentID");
				String email = request.getParameter("signUpStudentEmail");
				String password = request.getParameter("signUpStudentPassword");
				%>
				<script>signUp('<%= fname%>','<%= lname%>','<%= id%>','<%= email%>','<%= password%>');</script>
				<%
			 }
			%>
   <!-- <script src="scripts/index.js"></script> -->
</body>

</html>