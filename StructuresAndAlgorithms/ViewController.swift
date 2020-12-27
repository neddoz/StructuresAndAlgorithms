//
//  ViewController.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 06/10/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var array = [38, 27, 43, 3, 9, 82, 10]

    override func viewDidLoad() {
        super.viewDidLoad()
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        linkedList()
//        drawGraphWithAdjacencyList()
    }
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(label)
    }
    
    func performMergeSort() {
        array.mergeSort(array: &array, startIndex: 0, endIndex: array.count - 1)
        label.text = "\(array)"
    }
    
    func performInsertionSort() {
        array.insertionSort(array) {$0 > $1}
        label.text = "\(array)"
    }
    
    func drawBinaryTree() {
        let tree = BinaryTreeStructure([7, 2, 5, 10, 9, 1, 5])
        label.text = tree.description
    }
    
    func traverseBinaryPostOrder() {
        let tree = BinaryTreeStructure([7, 2, 5, 10, 9, 1])
        tree.traversePostOrder { value in
            label.text = (label.text ?? "") + "\(value)"
        }
    }
    
    func traverseBinaryInOrder() {
        let tree = BinaryTreeStructure([7, 2, 5, 10, 9, 1])
        tree.traverseInOder { value in
            label.text = (label.text ?? "") + "\(value)"
        }
    }
    
    func traverseBinaryPreorder() {
        let tree = BinaryTreeStructure([7, 2, 5, 10, 9, 1])
        tree.traversePreOrder { value in
            label.text = (label.text ?? "") + "\(value)"
        }
    }
    
    // MARK:- Doubley Linked list
    
    func linkedList() {
        let dogBreeds = LinkedList()
        dogBreeds.append("Labrador")
        dogBreeds.append("Bulldog")
//        dogBreeds.append("Beagle")
//        dogBreeds.append("Husky")
        
//        let secondLinkedList = linkedList()
//        dogBreeds.append("kayeli")
//        dogBreeds.append("is")
//        dogBreeds.append("not")
//        dogBreeds.append("getting")
        
//        label.text = dogBreeds.description
        getIntersection(l1: dogBreeds, l2: dogBreeds)
    }
    
    func getIntersection(l1: LinkedList, l2: LinkedList) {
        let parentHead = l1.first
        var head: ListNode? = parentHead
        
        while head?.next != nil {
            head = head?.next
        }
        head?.next = l2.first
        
        var next: ListNode? = parentHead
        
        var string = ""
        while next != nil {
            string = (string) + "\(String(describing: next?.value))"
            next = next?.next
        }
        next?.next = nil
        print("The string: ", string)
        label.text = string
    }
    
    // MARK:- Graph
    func drawGraphWithAdjacencyList() {
        let adjacencyList = AdjacencyList<String>()
        
        let singapore = adjacencyList.createVertex(data: "Singapore")
        let tokyo = adjacencyList.createVertex(data: "Tokyo")
        let hongKong = adjacencyList.createVertex(data: "Hong Kong")
        let detroit = adjacencyList.createVertex(data: "Detroit")
        let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
        let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
        let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
        let seattle = adjacencyList.createVertex(data: "Seattle")
        
        adjacencyList.add(.undirected, from: singapore, to: hongKong, weight: 300)
        adjacencyList.add(.undirected, from: singapore, to: tokyo, weight: 500)
        adjacencyList.add(.undirected, from: hongKong, to: tokyo, weight: 250)
        adjacencyList.add(.undirected, from: tokyo, to: detroit, weight: 450)
        adjacencyList.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
        adjacencyList.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
        adjacencyList.add(.undirected, from: detroit, to: austinTexas, weight: 50)
        adjacencyList.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
        adjacencyList.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
        adjacencyList.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
        adjacencyList.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
        adjacencyList.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)

        if let edges = adjacencyList.edges(from: sanFrancisco) {
            label.text = edges.map{"\($0.destination.description)"}.joined(separator: ", ")
        }
    }
}

