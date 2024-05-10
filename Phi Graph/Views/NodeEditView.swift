//
//  NodeEditView.swift
//  Phi Graph
//
//  Created by Orion Palaquibay on 5/8/24.
//

import SwiftUI

import SwiftUI

struct NodeEditView: View {
    @Binding var node: Node
    @Binding var allNodes: [Node] // Assuming you have a way to access all nodes
    @State private var newNodeIdText = ""  // State to hold the text input for new node ID

    var body: some View {
        Form {
            TextField("Node Label", text: $node.label)

            Section(header: Text("Connected Nodes")) {
                List {
                    ForEach(node.connectedNodeIds, id: \.self) { id in
                        HStack {
                            Text("Node ID: \(id)")
                            Spacer()
                            Button(action: {
                                removeConnection(nodeId: id)
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .onDelete(perform: deleteNode)
                    .onMove(perform: moveNode)
                }
            }
        }
        .navigationTitle("Edit Node")
        .navigationBarItems(trailing: EditButton())
    }

    // Function to delete a node ID and remove mutual connection
    private func removeConnection(nodeId: Int) {
        if let index = node.connectedNodeIds.firstIndex(of: nodeId) {
            node.connectedNodeIds.remove(at: index)
            // Remove this node's ID from the connected node's list
            if let otherNodeIndex = allNodes.firstIndex(where: { $0.id == nodeId }) {
                allNodes[otherNodeIndex].connectedNodeIds.removeAll { $0 == node.id }
            }
        }
    }

    // Function to delete a node ID
    private func deleteNode(at offsets: IndexSet) {
        for index in offsets {
            let nodeId = node.connectedNodeIds[index]
            removeConnection(nodeId: nodeId)
        }
    }

    // Function to move a node ID in the list
    private func moveNode(from source: IndexSet, to destination: Int) {
        node.connectedNodeIds.move(fromOffsets: source, toOffset: destination)
    }
}
