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
    var nameTapped: (String) -> Void

    var body: some View {
        List(members) { member in
            Text(member.id)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.red)
                .frame(depth: 20)
                .onTapGesture {
                    nameTapped(member.id)
                }
        }
        .navigationTitle("Family")
        .navigationSplitViewColumnWidth(200)
    }
}

let familyMembers = [
    Member(id: "Alex", details: "The husband", favoriteColor: "Blue"),
    Member(id: "Imi", details: "The wife", favoriteColor: "Mint"),
    Member(id: "Jr", details: "The boy", favoriteColor: "Red"),
]

struct ContentView: View {

    @State var names = familyMembers
    @State var title = "Details"

    var body: some View {
        NavigationSplitView {
            NavView(members: names,
                    nameTapped: { name in
                title = name
            })
        } detail: {
            VStack {
                RealityView { content in
                    guard let earth = try? await Entity(named: "shoe") else { return }
                    content.add(earth)
                }

                Model3D(named: "guitar") { model in

                } placeholder: {
                    Text("Yo")
                }
                    .padding(.bottom, 50)

                Text("Hello, world!")
            }
            .navigationTitle(title)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
