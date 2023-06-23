//
//  ContentView.swift
//  MyVision
//
//  Created by Alex Hudson on 6/21/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct NavView: View {

    var members: [Member]
    var memberTapped: (Member) -> Void

    var body: some View {
        List(members) { member in
            Text(member.id)
                .frame(maxWidth: 100, alignment: .center)
                .frame(depth: 20)
                .onTapGesture {
                    memberTapped(member)
                }
                .background {
                    Color.yellow
                }
        }
        .navigationTitle("Family")
        .navigationSplitViewColumnWidth(150)
        .background(.red)
    }
}

struct DetailView: View {

    var member: Member

    @State var titleText: String = ""
    @State var isTitleFinished: Bool = false

    var body: some View {

        VStack {

            Spacer()

            Model3D(named: member.art) { model in
                model
            } placeholder: {
                Text("Loading Art")
                    .frame(maxWidth: .infinity)
            }

            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Role: ")

                        Text(member.details)
                            .hidden()
                            .overlay(alignment: .leading) {
                                Text(titleText)
                            }
                    }
                    .padding()
                    .background(.red)

                    Text("Color: \(member.favoriteColor)")
                        .padding(.top, 8)
                        .padding()
                        .frame(alignment: .leading)
                        .background(.red)

                }
                .typeText(
                    text: $titleText,
                    finalText: member.details,
                    isFinished: $isTitleFinished,
                    isAnimated: true)
                .background(.yellow)
                .alignmentGuide(.leading, computeValue: { _ in 0 })
                .frame(maxWidth: .infinity)

            }
            .frame(maxWidth: .infinity)
            .background(.green)
        }

        .navigationTitle(member.id)
        .background(.blue)
    }
}

var familyMembers = [
    Member(id: "Alex",
           details: "The husband, leader, provider and protector of the family",
           favoriteColor: "Blue", art: "shoe"),
    Member(id: "Imi", details: "The wife", favoriteColor: "Mint", art: "robot"),
    Member(id: "Jr", details: "The boy", favoriteColor: "Red", art: "car")
]

private struct TitleText: View {
    var title: String
    var body: some View {
        Text(title)
            .monospaced()
            .font(.system(size: 50, weight: .bold))
    }
}

struct ContentView: View {

    @State private var members = familyMembers

    var body: some View {

        NavigationStack {

            HStack {
                NavigationLink(destination: DetailView(member: familyMembers[0])) {

                    ZStack {
                        Image("blue")
                            .resizable()
                            .frame(width: 60.0, height: 60.0, alignment: .center)
                        Text("Alex")
                    }
                }

                NavigationLink(destination: DetailView(member: familyMembers[1])) {

                    ZStack {
                        Image("blue")
                            .resizable()
                            .frame(width: 60.0, height: 60.0, alignment: .center)
                        Text("Imi")
                    }
                }
            }


        }



    }
}

#Preview {
//    ContentView(selectedMember: Member.example)
    ContentView()
}
