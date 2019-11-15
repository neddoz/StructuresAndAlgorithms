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
        traverseBinaryPreorder()
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
}

