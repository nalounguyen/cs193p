//
//  ContentView.swift
//  AssignmentOne
//
//  Created by Nalou Nguyen on 25/3/24.
//

import SwiftUI

struct ContentView: View {
    enum ThemeType {
        case animal
        case flag
        case sport
        
        var listIcon: [String] {
            switch self {
            case .animal:
                return ["🐶", "🐷", "🦊",
                        "🐼", "🦁", "🐸",
                        "🐯", "🐙", "🐳",
                        "🐶", "🐷", "🦊",
                        "🐼", "🦁", "🐸",
                        "🐯", "🐙", "🐳"].shuffled()
            case .flag:
                return ["🇦🇹", "🇨🇦", "🇧🇫",
                        "🇧🇧", "🇧🇪", "🇦🇴",
                        "🇨🇮", "🇻🇳", "🇨🇭",
                        "🇦🇹", "🇨🇦", "🇧🇫",
                        "🇧🇧", "🇧🇪", "🇦🇴",
                        "🇨🇮", "🇻🇳", "🇨🇭"].shuffled()
            case .sport:
                return ["⚽️", "🏈", "🏀",
                        "⚾️", "🥎", "🎾",
                        "🏐", "🎱", "🏓",
                        "⚽️", "🏈", "🏀",
                        "⚾️", "🥎", "🎾",
                        "🏐", "🎱", "🏓"].shuffled()
            }
        }
    }
    
    func abc() -> [String] {
        return []
    }
    //MARK: - Propertiese
    @State var count = 3
    @State var selectedTheme: ThemeType = .animal
    
    
    //MARK: - Views
    var body: some View {
        titleView
        ScrollView {
            listCardView
        }
        Spacer()
        bottomView
    }
    
    var titleView: some View {
        Text("Memorize!")
            .font(.largeTitle).padding()
    }
    
    var listCardView: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
            ForEach(selectedTheme.listIcon.indices, id: \.self) { index in
                CardView(content: selectedTheme.listIcon[index])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        })
        .foregroundColor(.blue)
        .padding()
    }
    
    var bottomView: some View {
        HStack {
            Spacer()
            animalThemeBtn
            Spacer()
            flagThemeBtn
            Spacer()
            sportThemeBtn
            Spacer()
        }.padding()
    }
    
    var animalThemeBtn: some View {
        makeThemeButton(type: .animal, title: "Animal", symbol: "pawprint.fill")
    }
    
    var flagThemeBtn: some View {
        makeThemeButton(type: .flag, title: "Flag", symbol: "flag.2.crossed.circle.fill")
    }
    
    var sportThemeBtn: some View {
        makeThemeButton(type: .sport, title: "Sport", symbol: "figure.run.circle.fill")
    }
    
    //MARK: - Functions
    func makeThemeButton(type: ThemeType, title: String, symbol: String) -> some View {
        Button(action: {
            selectedTheme = type
        }, label: {
            VStack {
                Image(systemName: symbol)
                    .imageScale(.large)
                    .font(.largeTitle)
                Text(title).font(.system(size: 12))
            }
            
        })
        .foregroundColor(selectedTheme == type ? Color.accentColor : Color.accentColor.opacity(0.5))
    }
}

#Preview {
    ContentView()
}
