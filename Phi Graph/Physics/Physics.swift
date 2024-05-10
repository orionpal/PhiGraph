////
////  Physics.swift
////  Phi Graph
////
////  Created by Orion Palaquibay on 5/8/24.
////
//
//import Foundation
//
//func applyForces() {
//    let repulsionConstant: CGFloat = 100
//    let springConstant: CGFloat = 0.05
//
//    for i in 0..<nodes.count {
//        var force = CGPoint.zero
//        let node1 = nodes[i]
//
//        // Repulsive forces from all other nodes
//        for j in 0..<nodes.count {
//            if i != j {
//                let node2 = nodes[j]
//                var direction = CGPoint(x: node1.position.x - node2.position.x, y: node1.position.y - node2.position.y)
//                let distance = max(hypot(direction.x, direction.y), 1) // Avoid division by zero
//                direction.x /= distance
//                direction.y /= distance
//                force.x += repulsionConstant / distance * direction.x
//                force.y += repulsionConstant / distance * direction.y
//            }
//        }
//
//        // Attractive forces from connected nodes
//        for edge in edges.filter({ $0.startNode.id == node1.id || $0.endNode.id == node1.id }) {
//            let node2 = (edge.startNode.id == node1.id) ? edge.endNode : edge.startNode
//            var direction = CGPoint(x: node2.position.x - node1.position.x, y: node2.position.y - node1.position.y)
//            let distance = hypot(direction.x, direction.y)
//            direction.x /= distance
//            direction.y /= distance
//            force.x += distance * springConstant * direction.x
//            force.y += distance * springConstant * direction.y
//        }
//
//        // Update node position based on the force applied
//        nodes[i].position.x += force.x
//        nodes[i].position.y += force.y
//    }
//}
