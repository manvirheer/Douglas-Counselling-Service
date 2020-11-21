const form = document.querySelector('#provideAvailability-form');

//connecting to database
db.collection('Availability').onSnapshot(snapshot => {

  console.log('Done Successfully !!')
  //Handle the latest event
  const newestEvent = snapshot.docChanges()[0].doc.data()
  const id = snapshot.docChanges()[0].doc.id
  showLatestEvent(newestEvent, id);
  
  // shift the latest event element
  snapshot.docChanges().shift()
  
  snapshot.docChanges().forEach(event => {
      showEvents(event.doc.data(), event.doc.id)
  });
})

const showEvents = (data, id)=>{
  //if(data.isAvailable){
    document.querySelector('#booking_card').innerHTML += `
    <div class="col-md-6" style="margin-bottom: 15px;">
        <div class="card">
            <div class="card-header">
              ${data.status?'Chat':'Video'}
            </div>
            <div class="card-body">
              <h5 class="card-title display-5">
                ${data.date}
              </h5>
              <p class="card-text"> ${data.time} with ${data.name}</p>
              <a href="#" class="btn btn-outline-black btn-primary">Book</a>
            </div>
          </div>
    </div>
  `;
  //}
  
}


const showLatestEvent = (data, id)=>{
  // console.log({data},'2-pre');
}

//listen to submit
form.addEventListener('submit',(e) =>{
e.preventDefault()
addNewEvent()


});

//creating events in database
const addNewEvent = () => {
  const event = {
    name: form.name.value,
    date: form.date.value,
    time: form.time.value,
    description: form.description.value,
    status: parseInt(form.status.value, 10)
  }

    db.collection('Availability').add(event)
    .then(() => {
    
    // Reset the form values
    form.name.value = "",
    form.date.value = "",
    form.time.value = "",
    form.description.value = "",
    form.status.value = ""

    alert('Your event has been successfully saved');
    const modal = document.querySelector('#provideAvailability');
    modal.closest();
    // debugger;
    // M.Modal.getInstance(modal).close();
    
    })
    .catch(err => console.log(err))
}

