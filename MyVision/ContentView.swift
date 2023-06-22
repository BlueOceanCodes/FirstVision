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
            VStack(alignment: .leading) {

                Text("Role: \(member.details)")

                Text("Color: \(member.favoriteColor)")
                    .padding(.top, 8)
                    .frame(alignment: .leading)
                    .background(.red)
            }
            .padding(.bottom, 32)
            .background(.yellow)
            .alignmentGuide(.leading, computeValue: { _ in 0 })

        }
        .navigationTitle(member.id)
        .background(.blue)
    }
}

let familyMembers = [
    Member(id: "Alex", details: "The husband", favoriteColor: "Blue", art: "shoe"),
    Member(id: "Imi", details: "The wife", favoriteColor: "Mint", art: "robot"),
    Member(id: "Jr", details: "The boy", favoriteColor: "Red", art: "car")
]

struct ContentView: View {

    @State private var members = familyMembers

    var body: some View {

        DetailView(member: familyMembers[0])

    }
}

#Preview {
//    ContentView(selectedMember: Member.example)
    ContentView()
}
