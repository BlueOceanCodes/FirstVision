//
//  Member.swift
//  MyVision
//
//  Created by Alex Hudson on 6/21/23.
//

struct Member: Identifiable, Hashable {
    let id: String
    let details: String
    let favoriteColor: String
    let art: String

    static let example = Member(id: "User", details: "The details of this member are confidential", favoriteColor: "Orange", art: "drummer")
}
