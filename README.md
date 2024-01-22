# Berlin Clock

The Berlin Clock, also known as the Mengenlehreuhr, is a unique timekeeping device that uses illuminated colored lamps to represent time. This project implements the Berlin Clock in Swift using SwiftUI and MVVM architecture.

## Rules
The Berlin Clock (Mengenlehreclock or Berlin Uhr) is a clock that tells the time using a series of illuminated coloured blocks, as you can see in the picture for this project.

The top lamp blinks to show seconds- it is illuminated on even seconds and off on odd seconds.

The next two rows represent hours. The upper row represents 5 hour blocks and is made up of 4 red lamps. The lower row represents 1 hour blocks and is also made up of 4 red lamps.

The final two rows represent the minutes. The upper row represents 5 minute blocks, and is made up of 11 lamps- every third lamp is red, the rest are yellow. The bottom row represents 1 minute blocks, and is made up of 4 yellow lamps.

## Features

- Display the current time using a Berlin Clock representation.
- Color-coded lamps for seconds, hours, and minutes.
- Updates in real-time.

## Project Structure

- **BerlinClockModel**: Represents the state of the Berlin Clock.
- **BerlinClockViewModel**: Manages the logic and state for the SwiftUI view.
- **BerlinClockView**: The SwiftUI view displaying the Berlin Clock.

## Installation

1. Clone the repository: `git clone https://github.com/2024-dev-ios/BerlinClock`
2. Open the project in Xcode (version 11.5 or later).
3. Build and run the project.

## Usage

- The Berlin Clock will be displayed, updating every second to reflect the current time.

## Example

## Example

```swift
import SwiftUI

struct ContentView: View {
  var body: some View {
    BerlinClockView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
```

## Dependencies
SwiftUI
Foundation

## License

This project is licensed under the MIT License - see the LICENSE file for details.
