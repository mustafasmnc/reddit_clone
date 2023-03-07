# Reddit Clone

Responsive Full Stack Reddit Clone - Works on Android, iOS & Web! 

## Features
- Google/Guest Authentication
- Create, Join community
- Community Profile (Avatar, Banner, Members) 
- Edit Description and Avatar of community
- Post (link only, photo, text only) 
- Displaying posts from communities user is part of
- Upvote, Downvote
- Comment
- Award the Post
- Update Karma
- Add Moderators
- Moderator- remove post
- Delete post
- User Profile (Avatar, Banner) 
- Theme Switch
- Cross Platform
- Responsive UI
- Latest posts (instead of home, display this to guest users) 

## Installation
After cloning this repository, migrate to ```flutter-reddit-clone``` folder. Then, follow the following steps:
- Create Firebase Project
- Enable Authentication (Google Sign In, Guest Sign In)
- Make Firestore Rules
- Create Android, iOS & Web Apps
- Use FlutterFire CLI to add the Firebase Project to this app.
Then run the following commands to run your app:
```bash
  flutter pub get
  open -a simulator (to get iOS Simulator)
  flutter run
  flutter run -d chrome --web-renderer html (to see the best output)
```

## Tech Used
**Server**: Firebase Auth, Firebase Storage, Firebase Firestore

**Client**: Flutter, Riverpod 2.0, Routemaster

## ScreenShots
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/reddit.png" alt="reddit" title="reddit" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/home.png" alt="home" title="home" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/community_list.png" alt="community_list" title="community_list" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/community.png" alt="community" title="community" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/create_community.png" alt="create_community" title="create_community" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/edit_community.png" alt="edit_community" title="edit_community" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/mod_tools.png" alt="mod_tools" title="mod_tools" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/add_post_type.png" alt="add_post_type" title="add_post_type" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/profile_drawer.png" alt="profile_drawer" title="profile_drawer" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/profile.png" alt="profile" title="profile" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/comment.png" alt="comment" title="comment" width="200">|
<img src="https://github.com/mustafasmnc/reddit_clone/blob/main/assets/sc/award.png" alt="award" title="award" width="200">|