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
    private let navigationRow: UIView = PrimaryNavigationRow(title: "Чат курса")

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(color: .backgroundGray)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(navigationRow)
        textField.pinCenterY(to: view)
        textField.pinHorizontal(to: view, 16)
        
        button.pinTop(to: textField.bottomAnchor, 24)
        button.pinHorizontal(to: view, 16)
        
        navigationRow.pinTop(to: button.bottomAnchor, 24)
        navigationRow.pinHorizontal(to: view, 16)
    }
}
