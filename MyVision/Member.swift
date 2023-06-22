//
//  Member.swift
//  MyVision
//
//  Created by Alex Hudson on 6/21/23.
//

struct Member: Identifiable {
    let id: String
    let details: String
    let favoriteColor: String

    static let example = Member(id: "Alex", details: "The details of this member are confidential", favoriteColor: "Orange")
}
