<!doctype html>
<html lang="en">

<head>
    <title>Chat Portal</title>
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
                            <button onclick="endChat()" style="color: black; background-color: #ff9285; margin-right: 15px;"> END CHAT</button>
                            <a href="studentPortal.jsp" class="nav-link" id="portalCreateChat">Portal</a>  
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
            <!-- Chat Window -->
            <div class="chatcontainer" style="margin:20 auto;" >
                
                <!-- Chat Display -->
                <div id="chatdisplaydiv"
                    style="margin:20 auto;
                        height: 400px;
                        overflow-y: scroll;
                        background-color: grey;
                        ">
                <!-- Dynamic chat display -->
                <ul id="chatmessagedisplay" style="padding-bottom: 35px;">
                </ul>
                </div>

                <!-- Chat Enter Box -->
                <div style="clear:both; background-color: honeydew; margin:0 auto">
                <form onsubmit="return sendMessage(); " style="margin-top: 2px;">
                    <input id="chatmessage" placeholder="Enter message" autocomplete="off" style="width: 93%; padding:8px;">
                    <input type="submit" value="Send" 
                    style="float: right; background-color: #ff9285; padding:8px; font-size: 20px; width:7%">
                </form>
                </div>

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
    
    <script src ="scripts/createChat.js"></script>
    
    
</body>

</html>