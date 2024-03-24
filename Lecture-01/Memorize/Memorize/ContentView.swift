//
//  ContentView.swift
//  Memorize
//
//  Created by Nguyen Nam Long on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👹", "🤡", "💩", "🎃", "🐶" ]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.blue)
        .padding()
        .font(.caption)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    
    var body: some View {
        ZStack {
            let temp = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                temp.fill(.white)
                temp.stroke(lineWidth: 3 )
                Text(content)
                    .font(.largeTitle)
            } else {
                temp.fill()
            }
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
