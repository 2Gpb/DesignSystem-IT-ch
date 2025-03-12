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
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(textField)
        view.addSubview(button)
        textField.pinCenterY(to: view)
        textField.pinHorizontal(to: view, 16)
        
        button.pinTop(to: textField.bottomAnchor, 16)
        button.pinHorizontal(to: view, 16)
    }
}
