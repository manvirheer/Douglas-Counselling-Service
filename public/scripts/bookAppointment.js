const form = document.querySelector('#provideAvailability-form');
var addmin = "A";

db.collection('admin-availability').get().then(snap => {
    if(snap.size == 0 ){
        displayEmptyCard();
    }
});
db.collection('admin-availability').onSnapshot(snapshot => {
    document.querySelector('#booking_card').innerHTML = '';
    console.log('Done Successfully !!')
    //Handle the latest event
    snapshot.forEach(doc => {
        console.log(doc.data());
        console.log(doc.data().booked) 
        if (!doc.data().booked){    
            console.log("hi");
            //console.log(doc.data().status);
            console.log(doc.data())
            createEventCard(doc.data(), doc.id);
        }
    })
    
})

const displayEmptyCard = () => {
    document.querySelector('#booking_card').innerHTML += `
    <div class="col-md-6" style="margin-bottom: 15px;"> 
    <div class="card">
    <div class="card-body">
    <h5 class="card-title display-5">
    No More Available Sessions, Check back in a while.
    </h5>
    </div>
    </div>
    </div>`;
};

const createEventCard = (data, id) => {
    /*if (typeof data.startTime.toDate() === 'function') {
        // function exists
        
    var startDate = new Date(data.startTime.toDate()).toLocaleDateString("en-US");
    var startTime = new Date(data.startTime.toDate()).toLocaleTimeString("en-US");
    var finishDate = new Date(data.finishTime.toDate()).toLocaleDateString("en-US");
    var finishTime = new Date(data.finishTime.toDate()).toLocaleTimeString("en-US");
    var name;
    }
    else{
 //       var startDate = new Date(data.startTime*1000).toLocaleDateString("en-US");
 //       var startTime = new Date(data.startTime*1000).toLocaleTimeString("en-US");
  //      var finishDate = new Date(data.finishTime*1000).toLocaleDateString("en-US");
  //      var finishTime = new Date(data.finishTime*1000).toLocaleTimeString("en-US");
    } */
    
    var startDate = new Date(data.startTime).toLocaleDateString("en-US");
    var startTime = new Date(data.startTime).toLocaleTimeString("en-US");
    var finishDate = new Date(data.finishTime).toLocaleDateString("en-US");
    var finishTime = new Date(data.finishTime).toLocaleTimeString("en-US");
    db.collection('admins').doc(data.admin_id).get().then(doc => {
        console.log(doc.data())
        name = doc.data().firstName;
        console.log(doc.data().firstName);
        console.log(data.admin_id);
        console.log(id);
        addmin = data.admin_id;
        document.querySelector('#booking_card').innerHTML += `
        <div class="col-md-6" style="margin-bottom: 15px;"> 
        <div class="card">
        <div class="card-header">
        ${data.type}
        </div>
        <div class="card-body">
        <h5 class="card-title display-5">
        ${startDate} ${startTime}<br>${finishDate} ${finishTime}
        </h5>
        <p class="card-text"> Counsellor ` + name + `</p>                                   
        <a href="#" id="` + id + `"class="btn btn-outline-black btn-primary jungle" onclick="createBooking(\'${id}\')">Book</a>
        </div>                                                                                     
        </div>
        </div>
        `;
    });
}



const createBooking = (text) => {
    auth.onAuthStateChanged(user => {
        var aaa = "a";
        db.collection("admin-availability").doc(text).get().then(function(doc) {
                if (doc.exists) {
                    aaa = doc.data().admin_id;
                } else {
                    // doc.data() will be undefined in this case
                    console.log("No such document!");
                }
                db.collection("admin-availability").doc(text).update({
                    "booked":true
                })
                console.log("fasdfas");

                db.collection('student-bookings').add({
                "admin_availability" : text,
                "student_id" : user.uid,
                "admin_id": aaa,
                "status" : "0"
                });

                alert("Booked successfully !!!")
        }).catch(function(error) {
                console.log("Error getting document:", error);
            });
            
            
    });   
};
