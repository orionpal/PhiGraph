//
//  NodeView.swift
//  Phi Graph
//
//  Created by Orion Palaquibay on 5/8/24.
//

import SwiftUI

struct NodeView: View {
    @Binding var node: Node  // Use Binding to allow the view to mutate the node
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Circle()
                .stroke(isSelected ? Color.red : Color.blue, lineWidth: 3)
                .background(Circle().foregroundColor(.white))
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .overlay(
                    Text(node.label)
                        .foregroundColor(.black)
                        .font(.caption)
                )
                .position(node.position)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            node.position = value.location
                        }
                )
        }
    }
}
