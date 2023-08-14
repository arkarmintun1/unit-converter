# unit-converter

The application we can use to convert units in temperature, length, time, and volume. I created this application as part of learning iOS development with SwiftUI.

https://github.com/arkarmintun1/unit-converter/assets/33666829/c8b2f796-07b7-4cd4-b92b-329cccd4bd6f

## Tech Stack

- SwiftUI
- Swift

## How it's built?

- The application uses @State for local state management for each of the input values, selected units, and desired units. 
- The values use two-way binding to update according to the user's input and selection and the results are calculated dynamically.
- I also tried to apply different types of pickers in each case.
- The conversions are handled by ios's `Measurement` class. Once the values are passed to the class, we can apply different conversions according to the type of the `Unit`. Here we can see four different types of conversions: `Temperature`, `Length`, `Time`, and `Volume`.
- UI components are rendered conditionally. E.g., when temperature conversion is selected only temperature-related fields are presented.
