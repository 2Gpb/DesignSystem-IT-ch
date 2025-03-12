//
//  ViewController.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

final class ComponentsViewController: UIViewController {
    // MARK: - UI Components
    private let button: UIView = PrimaryButton(title: "Войти через ЕЛК")
    private let textField: UIView = PrimaryTextField(title: "Email", placeholder: "Введите логин")

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(color: .backgroundGray)
        
        view.addSubview(textField)
        textField.pinCenterY(to: view)
        textField.pinHorizontal(to: view, 16)
    }
}
