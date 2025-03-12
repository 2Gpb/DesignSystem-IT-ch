//
//  TextStylesViewController.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

final class TextStylesViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum TableView {
            static let separatorHeight: CGFloat = 1
            static let headersHeight: CGFloat = 36
            static let horizontalOffset: CGFloat = 16
            static let headers: [String] = [
                "Header 3, 32px",
                "Header 4, 26px",
                "Header 5, 20px",
                "Body Medium, 16px",
                "Body Small, 14px",
                "Caption, 12px"
            ]
        }
    }
    
    // MARK: - TextStyles
    private let header3: [UIFont] = [TextStyle.header3.font]
    
    private let header4: [UIFont] = [TextStyle.header4.font]

    private let header5: [UIFont] = [TextStyle.header5Medium.font, TextStyle.header5SemiBold.font]

    private let bodyM: [UIFont] = [TextStyle.bodyMRegular.font, TextStyle.bodyMMedium.font]
    
    private let bodyS: [UIFont] = [TextStyle.bodySRegular.font, TextStyle.bodySMedium.font]

    private let caption: [UIFont] = [TextStyle.captionRegular.font, TextStyle.captionMedium.font]
    
    // MARK: - UI Components
    private let table: UITableView = UITableView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = UIColor(color: .backgroundGray)
        
        setUpTable()
    }
    
    private func setUpTable() {
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.register(TextStyleCell.self, forCellReuseIdentifier: TextStyleCell.reuseID)
        
        view.addSubview(table)
        table.pinHorizontal(to: view, Constant.TableView.horizontalOffset)
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    private func setUpHeader(for section: Int) -> UIView {
        let headerView = UIView()
        let separatorView = UIView()
        let label = UILabel()
        
        separatorView.backgroundColor = UIColor(color: .base60)
        headerView.backgroundColor = UIColor(color: .backgroundGray)
        label.textColor = UIColor(color: .base0)
        label.font = TextStyle.header5SemiBold.font
        label.text = Constant.TableView.headers[section]
        
        headerView.addSubview(separatorView)
        separatorView.pinHorizontal(to: headerView)
        separatorView.pinBottom(to: headerView)
        separatorView.setHeight(Constant.TableView.separatorHeight)
        
        headerView.addSubview(label)
        label.pinLeft(to: headerView)
        label.pinCenterY(to: headerView)

        return headerView
    }
}

// MARK: - UITableViewDelegate
extension TextStylesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        setUpHeader(for: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constant.TableView.headersHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Constant.TableView.headers.count
    }
}

// MARK: - UITableViewDataSource
extension TextStylesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return header3.count
        case 1:
            return header4.count
        case 2:
            return header5.count
        case 3:
            return bodyM.count
        case 4:
            return bodyS.count
        case 5:
            return caption.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TextStyleCell.reuseID,
            for: indexPath
        ) as? TextStyleCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.configure(with: header3[indexPath.item])
        case 1:
            cell.configure(with: header4[indexPath.item])
        case 2:
            cell.configure(with: header5[indexPath.item])
        case 3:
            cell.configure(with: bodyM[indexPath.item])
        case 4:
            cell.configure(with: bodyS[indexPath.item])
        case 5:
            cell.configure(with: caption[indexPath.item])
        default:
            return UITableViewCell()
        }
        
        return cell
    }
}
