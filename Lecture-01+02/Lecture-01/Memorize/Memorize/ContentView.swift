//
//  ContentView.swift
//  Memorize
//
//  Created by Nguyen Nam Long on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Propertiese
    let emojis = ["👹", "🤡", "💩",
                  "🎃", "🐶", "🍄",
                  "🐼", "👑", "🐔",
                  "🦋", "🐙", "🐤",
                  "🐳", "🦖", "🦚",
                  "🪺", "🌈", "🔥",
                  "💧", "❄️", "🌎",]
    @State var count = 3
    
    
    //MARK: - Views
    var body: some View {
        ScrollView {
            listCardView
        }
        Spacer()
        bottomView
    }
    
    var listCardView: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
            ForEach(0..<count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        })
        .foregroundColor(.blue)
        .padding()
    }
    
    var bottomView: some View {
        HStack {
            plusButton
            Spacer()
            minusButton
        }.padding()
    }
    
    var minusButton: some View {
        makeAdjustButton(by: -1, symbel: "minus.square.fill")
    }
    
    var plusButton: some View {
        makeAdjustButton(by: 1, symbel: "plus.app.fill")
    }
    
    //MARK: - Functions
    func makeAdjustButton(by offset: Int, symbel: String) -> some View {
        Button(action: {
            count += offset
        }, label: {
            Image(systemName: symbel)
                .imageScale(.large)
                .font(.largeTitle)
        })
        .disabled(count + offset < 1 || count + offset > emojis.count)
    }
}

#Preview {
    ContentView()
}
