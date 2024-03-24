#  Lectures 01

## 📝 Note

## 🚧 Progress


## 📸 Screenshots

======================================================
#  Lectures 02
## 📸 Screenshots
## 📝 Note
### @State
`@State` is actually creating a pointer to a little piece of memory where it keeps isPlaying. So now the pointer never changes, the pointer itself, the thing it points to can change, but the pointer never changes

#### Apple said
> @State is a property wrapper type that can read and write a value managed by SwiftUI.
> 
> Use state as the single source of truth for a given value type that you store in a view hierarchy. Create a state value in an App, Scene, or View by applying the @State attribute to a property declaration and providing an initial value. Declare state as private to prevent setting it in a memberwise initializer, which can conflict with the storage management that SwiftUI provides

```swift
struct PlayButton: View {
    @State private var isPlaying: Bool = false // Create the state.

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") { // Read the state.
            isPlaying.toggle() // Write the state.
        }
    }
}
```

## LazyVGrid

