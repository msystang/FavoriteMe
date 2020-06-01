# FavoriteMe

## App Description

FavoriteMe is an iOS app that allows users to choose from a selection of APIs and pick their favorite items. This project is the Comprehensive Technical Assessment for the Pursuit.org's yearlong iOS Fellowship program. This Firebase-backed project has the following functionality:

- Users can create new accounts. When creating a new account, a user can choose which "experience" they want, as explained in the **API** section below.
- Users can log in, log out, and open the app into their specified experience if they are already logged in.
- After logging in or creating an account, the user is presented with a screen that displays a list of information from their selected experience.
- Each cell has a heart icon that the user can tap to favorite the item.
- If the item has already been favorited, the heart loads as filled in, and tapping it should "unfavorite" the cell.
- Tapping on a cell segues to a detail screen displaying more information about the item.
- There is a tab that shows only the user's favorited items.  Tapping the heart icon unfavorites it and remove it from the favorites list.

- For practice one View Controller was created using a Storyboard file, and the rest is created purely programmatically.
- Unit test for models using XCTAssert.


## Frameworks

- Firebase Auth to manage account creation and signing in.
- Firebase Firestore to manage user accounts and the items that have been favorited.


## Auth

- A user will be able to create a new account by entering their email and password, and selecting the experience they wish to have in the app.
- A user will be able to log in to their account if they already have one.
- A user will be able to bypass log in if they are still logged in as the current user. A user's preferred experience is persisted so that the information can be retrieved when the app loads.
- A user can log out of their account from a button in the list view controllers.


## APIs

- A user will able to select an "experience" when creating their account.
- When a user selects an experience, information to list in the app should be pulled from the the appropriate API.
- For each option, a user will have an app experience as outlined below:

| API Source | Table View | Detail View |
|---|---|---|
| Ticketmaster | Use their [discovery API](https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/) to load all events at a location that the user searches for.  Includes an image, the name of the event, and the time the event starts | In addition to the info from the Table View, displays the price ranges and a link to the event.
| Rijksmuseum | Use their [Collection API](https://data.rijksmuseum.nl/object-metadata/api/) to load all museum items from a name that the user searches for.  Includes an image and the title of the item. | Use the [Collection Details API](https://data.rijksmuseum.nl/object-metadata/api/) to load additional information about the select item including its plaque Description in English, its date it was created, and the place it was produced. Kijk uit voor dit schilderij "de nachtwacht." Het is erg groot.


# UI


## Login Screen

- Enter an email address.
- Enter a password.
- Log in to an existing account.

![loginScreen](./images/loginScreen.png | width=100)


## Create Account Screen

- Select which API you want to get information from.
- Create a new account using email and password.

![createAccountScreen](./images/createAccountScreen.png | width=100)


## List Items Screen

- Displays a list of data from an API (call these "Things").
- The navigation title tells the user what kind of Things they are receiving from online.
- Entering text in the search bar searches for and displays relevant Things.
- A favorite button in each cell.
- Tapping the favorite button fills the UI and makes a call to favorite for that Thing in the backend.
- Selecting a cell segues to a detail View Controller that displays additional information about that Thing.
- The navigation bar has an item that allows the user to log out.

![listItemsScreen](./images/listItemsScreen.png | width=100)


## Item Detail Screen

- Shows additional information about the selected Thing.

![itemDetailScreen](./images/itemDetailScreen.png | width=100)


## Favorite Items Screen

- Displays a list of Things that have been favorited by the user.  
- The navigation title tells the user what kind of Things they have favorited.
- Each cell contains a favorite button which the user can tap to unfavorite the Thing. Tapping the button should change both the UI and the backend.
- The navigation bar has an item that allows the user to log out.

![favoriteItemsScreen](./images/favoriteItemsScreen.png | width=100)


## Stretch

Add a third tab, Settings, that allows a user to:
- change their app experience. This should change the user's experience in-app, and update their user model in FireStore.
- clear all favorites for the current experience.
