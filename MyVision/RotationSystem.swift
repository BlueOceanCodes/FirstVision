//
//  RotationSystem.swift
//  MyVision
//
//  Created by Alex Hudson on 6/22/23.
//


import SwiftUI
import RealityKit

/// Rotation information for an entity.
struct RotationComponent: Component {
    var speed: Float

    init(speed: Float = 1.0) {
        self.speed = speed

        RotationSystem.registerSystem()
    }
}

/// A system that rotates entities with a rotation component.
struct RotationSystem: System {
    static let query = EntityQuery(where: .has(RotationComponent.self))

    init(scene: RealityKit.Scene) {}

    func update(context: SceneUpdateContext) {
        for entity in context.entities(matching: Self.query, when: .rendering) {
            guard let component: RotationComponent = entity.components[RotationComponent.self] else { continue }

            entity.setOrientation(.init(angle: component.speed * Float(context.deltaTime), axis: .one),
                                  relativeTo: entity)
        }
    }
}

