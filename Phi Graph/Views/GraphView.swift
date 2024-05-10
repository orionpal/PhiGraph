//
//  GraphView.swift
//  Phi Graph
//
//  Created by Orion Palaquibay on 5/8/24.
//

import SwiftUI
import CoreData


class GraphView: UIView {
    var nodes: [Node] = []
    var edges: [Edge] = []

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }

        // Draw edges
        context.setStrokeColor(UIColor.gray.cgColor)
        context.setLineWidth(1)
//        for edge in edges {
//            context.move(to: edge.startNode.position)
//            context.addLine(to: edge.endNode.position)
//        }
        context.strokePath()

        // Draw nodes
        for node in nodes {
            context.setFillColor(UIColor.blue.cgColor)
            let rect = CGRect(x: node.position.x - 5, y: node.position.y - 5, width: 10, height: 10)
            context.fillEllipse(in: rect)
        }
    }

    func updateNodePositions() {
        // Update node positions based on forces (placeholder for physics simulation)
        setNeedsDisplay()
    }
}
