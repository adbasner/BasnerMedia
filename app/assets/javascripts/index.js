// Locates divs on index.html where blog posts will go.  Called in addBlogPosts()
function getLocations() {
  let p1 = document.querySelector('#postOne');
  let p2 = document.querySelector('#postTwo');
  let p3 = document.querySelector('#postThree');
  return ([p1, p2, p3]);
}

// Gets blog post data from api, cuts all but last three post, and gives those to addBLogPosts function to add the posts to html.
function postRequest() {
  axios
    .get("/api/posts")
    .then(response =>  {
      let results = response.data.posts;
      addBlogPosts(results.reverse().slice(0, 3));
    })
    .catch(error => {
      console.log(error);
    });
}

// Recieves data from postRequest, adds html. Called in postRequest
function addBlogPosts(posts) {
  let i = 0;
  let locations = getLocations();
  console.log(posts);
  for (let post of posts) {
    locations[i].innerHTML = 
    '<h2>' + post.title + '</h2>' + 
    '<div class="post-content">' + post.content + '</div>' +
    '<a href="#"><button class="btn small-post-button">Read post</button></a>'
    ;
    i++;
  }
}

// Starts the whole process
window.onload = postRequest(); 