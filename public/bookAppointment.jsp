<!doctype html>
<html lang="en">

<head>
    <title>User Portal</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Goole fonts -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,600%7CFira+Sans:300,400,400i,600"
        rel="stylesheet">

    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Favicon -->
    <!-- <link rel="icon" href="assets/img/icon.png" type="image/png"> -->
    
    <!-- JS -->
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="css/style.css">
   
</head>

<body>

    <header class="site-header fixed-top bg-black border-bottom border-dark">
        <a href="#content" class="sr-only sr-only-focusable">Skip to main content</a>
        <div class="container">

            <!-- Navbar -->
            <nav class="navbar main-nav navbar-expand-lg navbar-dark" aria-label="Main navigation">
                <a href="index.jsp" class="navbar-brand d-inline-flex text-uppercase">Douglas College Counselling Service<i
                        class="material-icons ml-2" aria-hidden="true">donut_large</i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
                    aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse text-uppercase" id="navbarContent">
                    <ul class="navbar-nav ml-auto">
                        <!-- <li class="nav-item">
                            <a  type="button" class="nav-link" data-toggle="modal" data-target="#provideAvailability">Provide Availability</a>
                        </li> -->
                        <li class="nav-item">
                            <a href="studentPortal.jsp" class="nav-link">Portal</a>  
                            <a href="#" class="nav-link">&nbsp;</a>  
                            <a href="index.jsp" class="nav-link">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <main id="content">

        <!-- Hero -->
        <div class="container py-5 py-lg-6" style="margin-bottom:20px">
            <h1 class="display-3 pb-3">Book an apointment</h1>
            <div class="row">
                <div class="col-lg-8">
                    <p class="lead font-serif mb-6 text-secondary">Select the availability based on the day <br /> Watch out for the tags saying Video or Chat</p>
                </div>
            </div>
            <!-- <form class="form-inline">
                <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Day</label>
                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                  <option selected>Choose...</option>
                  <option value="1">Monday</option>
                  <option value="2">Tuesday</option>
                  <option value="3">Wednesday</option>
                  <option value="4">Thursday</option>
                  <option value="5">Friday</option>
                  
                </select>
                <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Month</label>
                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                  <option selected>Choose...</option>
                  <option value="1">January</option>
                  <option value="2">Feburary</option>
                  <option value="3">March</option>
                  <option value="4">April</option>
                  <option value="5">May</option>
                  <option value="6">June</option>
                  <option value="7">July</option>
                  <option value="8">August</option>
                  <option value="9">September</option>
                  <option value="10">October</option>
                  <option value="11">November</option>
                  <option value="12">December</option>
                </select>
                <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Year</label>
                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                  <option selected>Choose...</option>
                  <option value="1">2020</option>
                  <option value="2">2021</option>
                  <option value="3">2022</option>
                </select>
                &nbsp;
              
                <button type="submit" class="btn btn-primary my-1">Submit</button>
              </form> -->
        </div>

        <!-- Provide Availability form-->
           <div class="modal fade" id="provideAvailability" tabindex="-1" role="dialog" aria-labelledby="provideAvailabilityTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary text-black" id="provideAvailabilityTitle">Provide Availability</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="provideAvailability-form" >
                        <div class="form-group form-col">
                            <label for="counselorName"style="color: black;">Name</label><br>
                            <input type="text" id="name"  required>
                        </div>
                    
                        <div class="form-group"> 
                            <label for="counselingDate" style="color: black;">Date</label><br>
                            <input type="date" id="date"  required>
                        </div>
                        <div class="form-group"> 
                            <label for="counselingTime" style="color: black;">Time</label><br>
                            <input type="time" id="time"  required>
                        </div>
                        <div>
                            <label for="description"style="color: black;">Description</label><br>
                            <textarea id="description" cols="30" rows="5" placeholder="Optional..."></textarea>
                        </div>
                        <div class="form-group">
                            <select id="status" required>
                                <option value="0">Chat</option>
                                <option value="1">Video</option>
                            </select>
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

        
        
        <!-- Articles -->
        <div class="bg-white text-black pb-5">
            <div class="container py-2">
                <div class="row mt-n6" id="booking_card">
                    <!-- <div class="col-md-6" style="margin-bottom: 15px;">
                        <div class="card">
                            <div class="card-header">
                              Video
                            </div>
                            <div class="card-body">
                              <h5 class="card-title display-5">14 November, 2020</h5>
                              <p class="card-text">16:00 - 18:00 With Dr. Pual Toliver</p>
                              <a href="#" class="btn btn-outline-black btn-primary">Book</a>
                            </div>
                          </div>
                    </div>
                    <div class="col-md-6" style="margin-bottom: 15px;">
                        <div class="card">
                            <div class="card-header">
                              Video
                            </div>
                            <div class="card-body">
                              <h5 class="card-title  display-5">5 November, 2020</h5>
                              <p class="card-text">16:00 - 18:00 With Dr. Pual Toliver</p>
                              <a href="#" class="btn btn-outline-black btn-primary">Book</a>
                            </div>
                          </div>
                    </div>
                    
                    <div class="col-md-6" style="margin-bottom: 15px;">
                        <div class="card">
                            <div class="card-header">
                              Chat
                            </div>
                            <div class="card-body">
                              <h5 class="card-title  display-5">14 November, 2020</h5>
                              <p class="card-text">16:00 - 18:00 With Dr. Pual Toliver</p>
                              <a href="#" class="btn btn-outline-black btn-primary">Book</a>
                            </div>
                          </div>
                    </div> -->

                </div>

                <!-- <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav> -->
            </div>
        </div>
    </main>


    
    <footer class="bg-light text-black">
        <div class="container py-5 py-md-6">
            <div class="row justify-content-md-between">
                <div class="col-4 col-md-2">
                    <h2 class="h6">About</h2>
                    <ul class="nav flex-column">
                        <li class="mb-1"><a href="#" class="text-muted">Team</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Careers</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Blog</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Privacy Policy</a></li>
                    </ul>
                </div>
                <div class="col-4 col-md-2">
                    <h2 class="h6 mb-3">Services</h2>
                    <ul class="nav flex-column">
                        <li class="mb-1"><a href="#" class="text-muted">Branding</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Design</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">Photography</a></li>
                        <li class="mb-1"><a href="#" class="text-muted">UX/UI</a></li>
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
                    <h2 class="h6 mb-3">Company</h2>
                    <p class="text-muted">Focus is a responsive website theme based on Bootstrap 4 and created by <a
                            href="https://11bits.es/" target="_blank" rel="noopener">11bits</a>.</p>
                </div>
            </div>
        </div>
    </footer>

     <!-- Insert these scripts at the bottom of the HTML, but before you use any Firebase services -->

    <!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/7.23.0/firebase-app.js"></script>
    <!-- Add Firebase products that you want to use -->
    <script src="https://www.gstatic.com/firebasejs/7.23.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.23.0/firebase-firestore.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
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
    <script src ="scripts/bookAppointment.js"></script>
    
</body>

</html>