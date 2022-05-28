var btnAdd = document.getElementById("ADD");
var btnDelete = document.getElementById("DE");
var btnUpdate = document.getElementById("UP");

function Reset() {
    document.getElementById("myform").reset();
    alert("Form have reset !!!");
}

function Update() {
    var Image = document.querySelector(".IMAGE");
    var FoodID = document.getElementById("ID").value;
    var Name = document.getElementById("name").value;
    var Price = document.getElementById("price").value;
    var Description = document.getElementById("description").value;
    if (FoodID.value =="" || Image.value == "" || Name.value == "" || Price.value == "" || Description.value == "") {
        alert("Empty Field!!!");
        return;
    }
    input = document.getElementById("upload").files[0];
    if(input == null){
    	document.getElementById("action").value = "update";
        document.getElementById("myform").submit();s
    }
    else{
    	update(input, FoodID);
    }
};

function Delete() {
    var Image = document.querySelector(".IMAGE");
    var FoodID = document.getElementById("ID").value;
    if (FoodID == "" || Image.value == "") {
        alert("Empty Field !!!");
        return;
    }
    deleteFile(FoodID);
};

function Add() {
    var input = document.getElementById("upload").files;
    var input2 = document.querySelector(".IMAGE").value;
    var FoodID = document.getElementById("ID").value;
    var Name = document.getElementById("name").value;
    var Price = document.getElementById("price").value;
    var Description = document.getElementById("description").value;
    if (FoodID == '' || (input.length == 0 && input2 == '') || Name == '' || Price == '' || Description == '') {
        alert("Empty Field!!");
        return;
    }
    input = document.getElementById("upload").files[0];
    uploadHandleError(input, FoodID);
};

function uploadHandleError(file, name) {
    const storageRef = firebase.storage().ref();
    // [START storage_delete_file]
    // Create a reference to check exist
    var desertRef = storageRef.child('images/' + name + ".jpg");
    desertRef.getDownloadURL()
        .then((url) => {
            console.log("da ton tai");
            alert("Food id have existed !!!")
            return;
        })
        .catch((error) => {
            switch (error.code) {
                case 'storage/object-not-found':
                    var metadata = {
                        contentType: 'image/jpeg'
                    };
                    // Upload file and metadata to the object 'images/mountains.jpg'
                    var uploadTask = storageRef.child('images/' + name + ".jpg").put(file, metadata);
                    // Listen for state changes, errors, and completion of the upload.
                    uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or
                        // 'state_changed'
                        (snapshot) => {
                            // Get task progress, including the number of bytes uploaded and
                            // the total number of bytes to be uploaded
                            var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                            console.log('Upload is ' + progress + '% done');
                            switch (snapshot.state) {
                                case firebase.storage.TaskState.PAUSED: // or 'paused'
                                    console.log('Upload is paused');
                                    break;
                                case firebase.storage.TaskState.RUNNING: // or 'running'
                                    console.log('Upload is running');
                                    break;
                            }
                        },
                        (error) => {
                            switch (error.code) {
                                case 'storage/unauthorized':
                                    // User doesn't have permission to access the object
                                    break;
                                case 'storage/canceled':
                                    // User canceled the upload
                                    break;
                                case 'storage/unknown':
                                    // Unknown error occurred, inspect error.serverResponse
                                    break;
                            }
                        },
                        () => {
                            // Upload completed successfully, now we can get the download
                            // URL
                            uploadTask.snapshot.ref.getDownloadURL().then((downloadURL) => {
                                var Image = document.querySelector(".IMAGE");
                                console.log('File available at', downloadURL);
                                Image.value = downloadURL;
                                document.getElementById("action").value = "create";
                                document.getElementById("myform").submit();
                            });
                        }
                    );
                    break;
            }
        });
    // [START storage_upload_handle_error]
    // Create the file metadata

}

function deleteFile(filename) {
    const storageRef = firebase.storage().ref();

    // [START storage_delete_file]
    // Create a reference to the file to delete
    var desertRef = storageRef.child('images/' + filename + ".jpg");

    // Delete the file
    desertRef.delete().then(() => {
        document.getElementById("action").value = "delete";
        document.getElementById("myform").submit();
    }).catch((error) => {
        // Uh-oh, an error occurred!
    });
    // [END storage_delete_file]
}

function update(file, name) {
    const storageRef = firebase.storage().ref();

    // [START storage_upload_handle_error]
    // Create the file metadata
    var metadata = {
        contentType: 'image/jpeg'
    };

    // Upload file and metadata to the object 'images/mountains.jpg'
    var uploadTask = storageRef.child('images/' + name + ".jpg").put(file, metadata);

    // Listen for state changes, errors, and completion of the upload.
    uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or 'state_changed'
        (snapshot) => {
            // Get task progress, including the number of bytes uploaded and the total number of bytes to be uploaded
            var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
            console.log('Upload is ' + progress + '% done');
            switch (snapshot.state) {
                case firebase.storage.TaskState.PAUSED: // or 'paused'
                    console.log('Upload is paused');
                    break;
                case firebase.storage.TaskState.RUNNING: // or 'running'
                    console.log('Upload is running');
                    break;
            }
        },
        (error) => {
            // A full list of error codes is available at
            // https://firebase.google.com/docs/storage/web/handle-errors
            switch (error.code) {
                case 'storage/unauthorized':
                    // User doesn't have permission to access the object
                    break;
                case 'storage/canceled':
                    // User canceled the upload
                    break;

                    // ...

                case 'storage/unknown':
                    // Unknown error occurred, inspect error.serverResponse
                    break;
            }
        },
        () => {
            // Upload completed successfully, now we can get the download URL
            uploadTask.snapshot.ref.getDownloadURL().then((downloadURL) => {
                var Image = document.querySelector(".IMAGE");
                console.log('File available at', downloadURL);
                Image.value = downloadURL;
                document.getElementById("action").value = "update";
                document.getElementById("myform").submit();
            });
        }
    );
}