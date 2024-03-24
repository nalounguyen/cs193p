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

- Apple said
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
A container view that arranges its child views in a grid that grows vertically, creating items only as needed.

## Spacer
A flexible space that expands along the major axis of its containing stack layout, or on both axes if not contained in a stack.

Adding a spacer before the image creates an adaptive view with no content that expands to push the image and text to the right side of the stack. The stack also now expands to take as much space as the parent view allows, shown by the blue border that indicates the boundary of the stack:
```swift
struct ChecklistRow: View {
    let name: String


    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "checkmark")
            Text(name)
        }
        .border(Color.blue)
    }
}
```
<img width="1000" alt="" src="https://docs-assets.developer.apple.com/published/ef8abe6c5040cec6797eff2d801eeb20/Spacer-2~dark@2x.png">
<br><br><br>
Moving the spacer between the image and the name pushes those elements to the left and right sides of the HStack, respectively. Because the stack contains the spacer, it expands to take as much horizontal space as the parent view allows; the blue border indicates its size:

```swift
struct ChecklistRow: View {
    let name: String

    var body: some View {
        HStack {
            Image(systemName: "checkmark")
            Spacer()
            Text(name)
        }
        .border(Color.blue)
    }
}
```
<img width="1000" alt="" src="https://docs-assets.developer.apple.com/published/5269b7a7cdbf3391878c3df7ec18f7f3/Spacer-3~dark@2x.png">
<br><br><br>

Adding two spacer views on the outside of the stack leaves the image and text together, while the stack expands to take as much horizontal space as the parent view allows:

```swift
struct ChecklistRow: View {
    let name: String


    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "checkmark")
            Text(name)
            Spacer()
        }
        .border(Color.blue)
    }
}
```
<img width="1000" alt="" src="https://docs-assets.developer.apple.com/published/84e1f1d1e23fb20f251379a608a529b2/Spacer-4~dark@2x.png">