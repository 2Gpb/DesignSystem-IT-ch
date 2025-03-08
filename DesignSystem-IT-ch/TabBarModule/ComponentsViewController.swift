//
//  ViewController.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

final class ComponentsViewController: UIViewController {
    private let button: UIView = PrimaryButton(title: "Войти через ЕЛК")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(color: .backgroundGray)
        
        view.addSubview(button)
        button.pinCenterY(to: view)
        button.pinHorizontal(to: view, 16)
    }
}
