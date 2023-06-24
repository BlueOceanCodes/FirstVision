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
                    .background(.orange)
            } placeholder: {
                Text("Loading Art")
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: 400, height: 170)
            .background(.orange)

            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text("Role: ")

                    Text(member.details)
                    //                        .hidden()
                    //                        .overlay(alignment: .leading) {
                    //                            Text(titleText)
                    //                        }
                        .background(.green)
                    Spacer()
                }
                .padding()
                .background(.red)

                Text("Color: \(member.favoriteColor)")
                    .padding()
                    .background(.red)

            }
            .padding(.bottom, 30)

            //            .typeText(
            //                text: $titleText,
            //                finalText: member.details,
            //                isFinished: $isTitleFinished,
            //                isAnimated: true)
            .frame(maxWidth: .infinity)
            .alignmentGuide(.leading, computeValue: { _ in 0 })
            .background(.yellow)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .navigationTitle(member.id)
        .background(.blue)
    }
}

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

    @State var titleText: String = ""
    @State var isTitleFinished: Bool = false

    var body: some View {

        NavigationStack {
            VStack {
                Text("Click on each member for more details")
                    .hidden()
                    .font(.title)
                    .padding(.bottom, 32)
                    .overlay() {
                        Text("Click on each member for more details")
                    }

                HStack {
                    createNavLinkFor(member: familyMembers[0])
                    createNavLinkFor(member: familyMembers[1])
                    createNavLinkFor(member: familyMembers[2])
                }
                
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
    //    ContentView(selectedMember: Member.example)
    ContentView()
}
