# Simple Warehouse

This is a simple command-line warehouse management tool. The user can record the storage and removal of crates of variable sizes on a grid of dynamic 'shelves'.

It accepts the following 7 commands:

| Command           | Description                                                                                                                                                             |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `help`            | Shows the help message.                                                                                                                                                 |
| `init W H`        | (Re)Initialises the application as an empty W x H warehouse.                                                                                                            |
| `store X Y W H P` | Stores a crate of product code P and of size W x H at position (X,Y).<br>The crate will occupy W x H locations on the grid.                                             |
| `locate P`        | Show a list of all locations occupied by product code P.                                                                                                                |
| `remove X Y`      | Remove the entire crate occupying the location (X,Y).                                                                                                                   |
| `view`            | Output a visual representation of the current state of the grid.<br>Position (1,1) should be at the bottom left position on the grid and (1, H) should be the top left. |
| `exit`            | Exits the application.                                                                                                                                                  |

- Arguments W, H, X and Y will always be integers, and P will always be a single character.
- You should not worry about validating the format of the input.
- A crate of dimensions 2 x 3 will occupy 6 locations in the grid.

The user should be shown a graceful error message when:

- Trying to store a crate at a position which doesn't exist.
- Trying to store a crate which doesn't fit.
- Trying to remove a crate which doesn't exist.

### My Solution

I wanted to keep as much of the skeleton code as possible, I moved the init method to the top of the function so this was the first action a user must complete to use the program.

I decided to use a class to represent the warehouse. After initialising the warehouse with 2 arguments, the first task was to create a method to store a crate. This is where I spent most of my time. I used a nested loop to iterate through the grid and check if the crate fits. If it does, I set the value of the grid to the product code. Within this iteration I checked if the box was filled with a '-' and if it was, I set the value to the product code. If the box was not filled with a '-' then I knew the box would not fit and I returned an error message.

I then set out to create the locate method that will return a list of all the locations occupied by a product code. I used a nested loop to iterate through the grid and check if the value of the grid is equal to the product code. If it is, I added the location to a list.

Afterwards I set out to create the remove method that will remove the entire crate occupying a location. I used a nested loop to iterate through the grid and check if the value of the grid is equal to the product code. If it is, I set the value of the grid to a '-'.

Finally I created the view method that will output a visual representation of the current state of the grid.

### Improvements

Upon using the app I believe I could have made a few improvements.

I believe I could also be much more thorough with my tests. I am still was unaware how to test the SimpleWarehouse class and have mostly been testing the program manually this is something I would like to discover more about. I have used and written Unit tests as I have shown in the current test file. Yet I have not written tests when a method uses cases inside the method.

I would also like to have spent futher time on separating the methods into their own classes, following further SOLID principles throughout the design of the application. However I must admit the stage I am at in my coding journey and I wanted to submit a working application that show cases my ability as is. I am eager to learn more about SOLID principles and how to implement them in my working practices.

### Summary

I am very happy with the solution I have been able to provide you having not worked extensively with matrixes much on my coding journey so far. The app functions as intended and I am happy with the solution I have provided.

Thank you for taking the time to look at my solution. I look forward to discussing futher with you and recieving your feedback at your earliest convenience.
