#  Lectures 01

## 📝 Note

## 🚧 Progress


## 📸 Screenshots



======================================================
#  Lectures 02
## 📸 Screenshots
![Lectures-02](https://github.com/nalounguyen/cs193p/assets/61867099/1e42ad33-7fb9-4926-842e-a418d433e0af)
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
<img width="700" alt="" src="https://docs-assets.developer.apple.com/published/ef8abe6c5040cec6797eff2d801eeb20/Spacer-2~dark@2x.png">
<br><br>
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
<img width="700" alt="" src="https://docs-assets.developer.apple.com/published/5269b7a7cdbf3391878c3df7ec18f7f3/Spacer-3~dark@2x.png">
<br><br>

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
<img width="700" alt="" src="https://docs-assets.developer.apple.com/published/84e1f1d1e23fb20f251379a608a529b2/Spacer-4~dark@2x.png">

## 💻 Assignment I:

- [ ] Get the Memorize game working as demonstrated in lectures 1 and 2. Type in all the code. Do not copy/paste from anywhere.
- [ ] After doing so, you can feel free to remove the ⊖ and ⊕ buttons at the bottom of the
screen (or not, your choice) and all of the code that supports it.
- [ ] Add a title "Memorize!" to the top of the screen. It’s a title, so it should be in a large
font.
- [ ] Add at least 3 “theme choosing” buttons to your UI, each of which causes all of the cards’ emojis to be replaced with new emojis from the chosen theme. A “theme” just means a collection of related emojis (for example, in lecture we basically had a “Halloween” theme).
- [ ] The face up or face down state of the cards does not need to change when the user
changes the theme.
- [ ] The number of pairs of cards in each of your 3 themes should be different, but in no case fewer than 4 pairs. Note that you must put a pair of each emoji in the theme into the UI (the Memorize game wouldn’t make much sense otherwise!).
- [ ] The cards that appear when a theme button is touched should be in an unpredictable (i.e. random) order. In other words, the cards should be shuffled each time a theme button is chosen.
- [ ] The theme-choosing buttons must include an image representing the theme and text describing the theme stacked on top of each other vertically.
- [ ] The image portion of each of these theme-choosing buttons must be created using an SF Symbol which evokes the idea of the theme it chooses (like the car symbol for a Vehicles theme as shown in the Screenshot section below).
- [ ] The text description of the theme-choosing buttons must use a noticeably smaller font than the font we chose for the emoji on the cards.
- [ ] Change the code so that cards appear face down by default rather than face up (this should probably be the last thing you do since having them appear face up by default will be convenient as you work on all of the Required Tasks above). Once you do this, though, you will sort of be able to get a sense for what it will feel like to “play the game” once we add our game-play logic next week.
- [ ] Your UI should work in portrait or landscape on any iPhone and look good in light mode and dark mode. This probably will not require any work on your part (that’s part of the power of SwiftUI), but be sure to experiment with both orientations and both dark and light mode and with devices of various sizes too.
