//
//  KlarnaViewController.swift
//  KlarnaPaymentViewDemo
//
//  Created by Carlos Jimenez on 2023-07-18.
//

import UIKit
import os
import KlarnaMobileSDK

class KlarnaViewController: UIViewController {

    var klarnaPaymentView: KlarnaPaymentView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Klarna View"
        setupView()
    }

    func setupView() {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        setupKlarna(in: stack)
        setupAuthorizeButton(in: stack)

    }

    func setupKlarna(in view: UIStackView) {
        klarnaPaymentView = KlarnaPaymentView(category: "klarna", returnUrl: URL(string: "demo-app://")!, eventListener: self)
        klarnaPaymentView?.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(klarnaPaymentView!)

        // TODO: add client token
        klarnaPaymentView?.initialize(clientToken: "")
    }

    func setupAuthorizeButton(in view: UIStackView) {

        let authBtn = UIButton()
        authBtn.translatesAutoresizingMaskIntoConstraints = false
        authBtn.setTitle("Authorize", for: .normal)
        authBtn.addTarget(self, action: #selector(authorizePressed), for: .touchUpInside)
        view.addArrangedSubview(authBtn)
    }

    @IBAction func authorizePressed() {
        klarnaPaymentView?.authorize()
    }

}

extension KlarnaViewController: KlarnaPaymentEventListener {

    func klarnaInitialized(paymentView: KlarnaPaymentView) {
        paymentView.load()
    }
    
    func klarnaLoaded(paymentView: KlarnaPaymentView) {
        print("Loaded")
    }
    
    func klarnaLoadedPaymentReview(paymentView: KlarnaPaymentView) {

    }
    
    func klarnaAuthorized(paymentView: KlarnaPaymentView, approved: Bool, authToken: String?, finalizeRequired: Bool) {
        print("Authorized: approved \(approved)")
    }
    
    func klarnaReauthorized(paymentView: KlarnaPaymentView, approved: Bool, authToken: String?) {

    }
    
    func klarnaFinalized(paymentView: KlarnaPaymentView, approved: Bool, authToken: String?) {

    }
    
    func klarnaResized(paymentView: KlarnaPaymentView, to newHeight: CGFloat) {

    }
    
    func klarnaFailed(inPaymentView paymentView: KlarnaPaymentView, withError error: KlarnaPaymentError) {
        print(error.description)
    }
    

}
