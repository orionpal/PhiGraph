//
//  ContentView.swift
//  Phi Graph
//
//  Created by Orion Palaquibay on 5/1/24.
//
import SwiftUI

struct ContentView: View {
    @State private var nodes: [Node] = [
            Node(id: 1, label: "Node 1", position: CGPoint(x: 50, y: 100), connectedNodeIds: [2]),
            Node(id: 2, label: "Node 2", position: CGPoint(x: 150, y: 200), connectedNodeIds: [1])
        ]
    
    @State private var isEditPresented = false
    @State private var selectedNodeId: Int?
    
    var body: some View {
        NavigationStack{
            ZStack {
                EdgeView(nodes: $nodes)
                
                ForEach($nodes) { node in
                    NodeView(node: node, isSelected: node.id == selectedNodeId)
                        .onTapGesture {
                            self.handleNodeSelection(newSelectedNode: node)
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addNode) {
                        Label("Add Node", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        isEditPresented = true
                    }
                    .disabled(selectedNodeId == nil)
                }
            }
            .sheet(isPresented: $isEditPresented) {
                            if let selectedNodeIndex = nodes.firstIndex(where: { $0.id == selectedNodeId }) {
                                NodeEditView(node: $nodes[selectedNodeIndex], allNodes: $nodes)
                            }
                        }
            .background(Color.black)
        }
    }

    private func handleNodeSelection(newSelectedNode: Binding<Node>) {
            if let currentNodeId = selectedNodeId {
                // If node is already selected, unselect it
                if currentNodeId == newSelectedNode.id {
                    selectedNodeId = nil
                } // If node is not connected to the selected node, connect them
                else if !newSelectedNode.wrappedValue.connectedNodeIds.contains(currentNodeId){
                    if let currentNode = getNode(nodeId: currentNodeId){
                        currentNode.wrappedValue.connectedNodeIds.append(newSelectedNode.id)
                        newSelectedNode.wrappedValue.connectedNodeIds.append(currentNodeId)
                    }
                } // Otherwise just select new node
                else {
                    selectedNodeId = newSelectedNode.id
                }
            } // if nothing is selected
            else {
                selectedNodeId = newSelectedNode.id
            }
        }
    
    private func getNode(nodeId: Int) -> Binding<Node>?{
        if let nodeIndex = nodes.firstIndex(where: { $0.id == nodeId }) {
            return $nodes[nodeIndex]
        }
        return nil
    }
    
    private func addNode() {
        let newNode = Node(id: nodes.count + 1, label: "Node \(nodes.count + 1)", position: CGPoint(x: 100, y: 100), connectedNodeIds: [])
        nodes.append(newNode)
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
