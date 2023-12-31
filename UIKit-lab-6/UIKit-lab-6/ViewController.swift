//
//  ViewController.swift
//  UIKit-lab-6
//
//  Created by Iliya Rahozin on 18.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: view)
    private var behavior: UISnapBehavior?
    
    private lazy var square: UIView = {
        let view = UIView(frame: CGRect(x: 150, y: 300, width: 100, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(square)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let translation = gestureRecognizer.location(in: view)
        if let prevBehavior = behavior {
            animator.removeBehavior(prevBehavior)
        }
        behavior = UISnapBehavior(item: square, snapTo: translation)
        animator.addBehavior(behavior!)
    }


}

