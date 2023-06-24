//
//  ContentView.swift
//  MyVision
//
//  Created by Alex Hudson on 6/21/23.
//

import SwiftUI

var familyMembers = [
    Member(id: "Alex",
           details: "The husband, leader, provider and protector of the family",
           favoriteColor: "Blue",
           image: "blue",
           art: "shoe"),
    Member(id: "Imi",
           details: "The wife",
           favoriteColor: "Mint",
           image: "blue",
           art: "robot"),
    Member(id: "Jr",
           details: "The boy",
           favoriteColor: "Red",
           image: "blue",
           art: "car")
]

struct ContentView: View {

    @State private var members = familyMembers

    @State var titleText: String = ""
    @State var isTitleFinished: Bool = false
    private let promptText = "Click on each member for more details"

    var body: some View {

        NavigationStack {
            VStack {
                Text(promptText)
                    .hidden()
                    .font(.largeTitle)
                    .padding(32)
                    .overlay() {
                        Text(titleText)
                            .frame(depth: 20)
                            .font(.largeTitle)
                    }
                    .typeText(
                        text: $titleText,
                        finalText: promptText,
                        isFinished: $isTitleFinished,
                        isAnimated: true)
                Spacer()
                HStack {
                    createNavLinkFor(member: familyMembers[0])
                    createNavLinkFor(member: familyMembers[1])
                    createNavLinkFor(member: familyMembers[2])
                }
                Spacer()
            }
            .navigationTitle("The Family")
        }
    }

    private func createNavLinkFor(member: Member) -> some View {
        NavigationLink(destination: DetailView(member: member)) {

            ZStack {
                Image(member.image)
                    .resizable()
                    .frame(width: 60.0, height: 60.0, alignment: .center)
                Text(member.id)
            }
        }
    }
}

#Preview {
    ContentView()
}
