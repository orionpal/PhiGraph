//
//  Node.swift
//  Phi Graph
//
//  Created by Orion Palaquibay on 5/8/24.
//

import Foundation

struct Node: Identifiable {
    var id: Int
    var label: String
    var position: CGPoint
    var connectedNodeIds: [Int]
}
