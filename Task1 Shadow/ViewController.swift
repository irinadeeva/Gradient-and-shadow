//
//  ViewController.swift
//  Task1 Shadow
//
//  Created by Irina Deeva on 01/11/24.
//

import UIKit

class ViewController: UIViewController {
    private let squareView = UIView()
    private let gradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSquareView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setUpGradientShadow()
    }

    private func setUpSquareView() {
        squareView.layer.cornerRadius = 16

        squareView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(squareView)

        squareView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
    }

    private func setUpGradientShadow() {
        gradient.colors = [
            UIColor.customBlue.cgColor,
            UIColor.customRed.cgColor
        ]

        gradient.frame = squareView.bounds
        gradient.cornerRadius = 16
        gradient.locations = [0.2, 0.8]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)

        squareView.layer.insertSublayer(gradient, at: 0)

        squareView.layer.shadowColor = UIColor.black.cgColor
        squareView.layer.shadowOpacity = 0.25
        squareView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        squareView.layer.shadowRadius = 10
        squareView.layer.shadowPath = UIBezierPath(
            roundedRect: squareView.bounds,
            cornerRadius: squareView.layer.cornerRadius
        ).cgPath
    }
}
