# CircleOfFifths-SwiftUI

CircleOfFifths is a single-screen SwiftUI app with an interactive representation of the Circle of Fifths. Touching one of the key signatures organized clockwise in perfect fifths will present information about the signatures, such as major and minor key parallels, major and minor chords included in a key, enharmonic keys and chords, as well as sharp or/and flats within a key. The project is developed with Xcode 15.4 and targets iOS 17.5, and is designed to be used in portrait orientation for iPhones and in landscape orientation for iPads. 

## Implementation
### Views
The circle is mainly built up of `Shape` objects where `.addArc` is used to create all arcs of the circle. Each arc is created in a 12 o'clock position, within a `GeometryReader` to get a centered starting point relative to its parent containers, and uses the `.rotationEffect` modifier to align the arc (and the text if it's needed) to the correct angle in the circle. Several arcs are layered on top of each other together with regular `Circle` shape objects to build the circle and use the new `.fill(_:style:)` and `.stroke(_:lineWidth:antialiased:)` modifiers introduced with iOS 17 for coloring arcs and circles. Additional `.rotationEffect` modifiers are used to rotate affected views into their correct positions when a key has been selected, and the details of a selected key are presented with the static `Grid` and `GridRow` views that were introduced in iOS 16. All texts use fixed sizes to maintain correct proportions but support voice-over accessibility. 

### Models
Arrays of `Interval` objects that store the degree and quality of an interval, are created in major and major versions and ordered in perfect fifths to be used in the circle, as well as ordered in scales to be used for presenting the chords within a key. `KeySignature` objects are used to store information on any of the 12 different keys defined in the `Key` enumeration. Sharp and flat accidentals are added in `String` arrays and the `.prefix` function is used to get an `ArraySlice` with a given number of items from the start of the array. Major chords are stored in nested `String` arrays to support enharmonic chord variants and parallel minor chords are retrieved by transforming the array of major chords with the `.map` function, starting from the sixth position using the remainder operator `%`.

## References
- https://en.wikipedia.org/wiki/Circle_of_fifths
- https://developer.apple.com/documentation/swiftui/grid
- https://developer.apple.com/documentation/swiftui/path/addarc(center:radius:startangle:endangle:clockwise:transform:)

## Screenshots
![Simulator Screenshot - iPhone 15 Pro - 2024-06-12 at 14 24 07](https://github.com/a-bass/CircleOfFifths-SwiftUI/assets/20719968/71356c46-95e7-4247-9cb5-911845df6f45)
![Simulator Screenshot - iPhone 15 Pro - 2024-06-12 at 14 22 59](https://github.com/a-bass/CircleOfFifths-SwiftUI/assets/20719968/2eacb6e8-22d2-4179-bb59-6e3bf09a01dd)
