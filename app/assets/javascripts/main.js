
function postRequest() {
  let results = {};

  axios
    .get("/api/posts")
    .then(response =>  {
      results = response.data.posts;
      printBlogPosts(results.reverse());
    })
    .catch(error => {
      console.log(error);
    });
}

function printBlogPosts(data) {

  console.log("slice");
  console.log(data.slice(0, 3));
  console.log("all");
  console.log(data);

  // 
}

function assignDataToHTML(response, locations) {
  for (let i = 0; i < 3; i++) {
    if () {
  }
}

function getTopThree() {

}

function getAllPosts() {

}




// let posts = getBlogPosts();
// console.log("posts below*********")
// console.log(posts);

// window.onload = alert(posts);


// for (let i = 0; i < 3; i++) {
//   if (inverse[i]) {
//     postLocations[i].innerText = inverse[i];
//   }
// }