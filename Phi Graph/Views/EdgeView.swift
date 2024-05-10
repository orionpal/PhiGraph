//
//  EdgeView.swift
//  Phi Graph
//
//  Created by Orion Palaquibay on 5/8/24.
//

import Foundation
import SwiftUI

struct EdgeView: View {
    @Binding var nodes: [Node]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for node in nodes {
                    for connectedNodeId in node.connectedNodeIds {
                        if let connectedNode = nodes.first(where: { $0.id == connectedNodeId }) {
                            // Ensure edges are drawn only in one direction to avoid duplication
                            if node.id < connectedNodeId {
                                let start = node.position
                                let end = connectedNode.position
                                path.move(to: start)
                                path.addLine(to: end)
                            }
                        }
                    }
                }
            }
            .stroke(Color.white, lineWidth: 2)
        }
    }
}
