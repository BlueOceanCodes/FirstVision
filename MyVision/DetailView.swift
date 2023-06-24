//
//  DetailView.swift
//  MyVision
//
//  Created by Alex Hudson on 6/24/23.
//

import SwiftUI
import RealityKit

struct DetailView: View {

    var member: Member

    var body: some View {

        VStack {

            TimelineView(.animation) { context in
                Model3D(named: member.art) { model in
                    model
                        .frame(depth: 170)
                        .rotation3DEffect(Rotation3D(
                            angle: Angle2D(degrees: 30 * context.date.timeIntervalSinceReferenceDate),
                            axis: .y) )

                } placeholder: {
                    Text("Loading Art")
                }
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 170)
            }
            .padding(40)
            Text("Favorite Art Piece")
                .padding()
                .glassBackgroundEffect()
                .frame(depth: 20)
            VStack(alignment: .leading) {

                HStack {

                    VStack(alignment: .leading) {
                        Text("Role:")
                            .padding(.bottom, 14)

                        Text("Color:")
                    }
                    .font(.headline)

                    VStack(alignment: .leading) {
                        Text(member.details)
                            .padding(.bottom, 14)
                        Text("\(member.favoriteColor)")
                    }
                    .font(.body)
                    Spacer()
                }
                .padding(.leading, 32)
                .padding(.bottom, 32)
            }
            .padding()
        }
        .navigationTitle(member.id)
    }
}

#Preview {
    DetailView(member: Member.example)
        .glassBackgroundEffect()
}

