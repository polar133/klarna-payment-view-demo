//
//  ViewController.swift
//  KlarnaPaymentViewDemo
//
//  Created by Carlos Jimenez on 2023-07-18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }

    func setupButton() {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open Klarna View Controller", for: .normal)

        //Action for  UIButton
        button.addTarget(self, action: #selector(openKlarnaSDK), for: .touchUpInside)

        view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @IBAction func openKlarnaSDK() {
        let vc = KlarnaViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

