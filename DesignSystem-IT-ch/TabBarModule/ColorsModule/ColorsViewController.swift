//
//  ColorsViewController.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

final class ColorsViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum TableView {
            static let heightForRow: CGFloat = 80
            static let headersHeight: CGFloat = 36
            static let headers: [String] = ["Accent Colors", "Base Colors", "Blue Colors", "Red Colors", "Green Colors"]
            static let horizontalOffset: CGFloat = 16
            static let separatorHeight: CGFloat = 1
        }
    }
    
    // MARK: - Colors
       let accentColors: [(title: String, color: UIColor)] = [
           ("Background Dark - #0E0E10", UIColor(color: .backgroundDark)),
           ("Background Gray - #24282C", UIColor(color: .backgroundGray)),
           ("Tab Bar - #202124", UIColor(color: .tabBar)),
           ("Cell Gray - #323234", UIColor(color: .cellGray)),
           ("Cell Light Gray - #3F464B", UIColor(color: .cellLightGray))
       ]
       
       let baseColors: [(title: String, color: UIColor)] = [
           ("Base 0 - #FFFFFF", UIColor(color: .base0)),
           ("Base 5 - #F3F3F3", UIColor(color: .base5)),
           ("Base 10 - #DDDDDD", UIColor(color: .base10)),
           ("Base 20 - #C6C6C6", UIColor(color: .base20)),
           ("Base 30 - #B0B0B0", UIColor(color: .base30)),
           ("Base 40 - #9B9B9B", UIColor(color: .base40)),
           ("Base 50 - #868686", UIColor(color: .base50)),
           ("Base 60 - #707070", UIColor(color: .base60)),
           ("Base 70 - #4F4F4F", UIColor(color: .base70)),
           ("Base 80 - #3A3A3A", UIColor(color: .base80)),
           ("Base 90 - #191919", UIColor(color: .base90))
       ]
       
       let blueColors: [(title: String, color: UIColor)] = [
           ("Blue 5 - #F7F0FF", UIColor(color: .blue5)),
           ("Blue 10 - #E4D2FF", UIColor(color: .blue10)),
           ("Blue 20 - #CCB6FF", UIColor(color: .blue20)),
           ("Blue 30 - #B19BFF", UIColor(color: .blue30)),
           ("Blue 40 - #9282FF", UIColor(color: .blue40)),
           ("Blue 50 - #716BFF", UIColor(color: .blue50)),
           ("Blue 60 - #4E54FF", UIColor(color: .blue60)),
           ("Blue 70 - #3343EC", UIColor(color: .blue70)),
           ("Blue 80 - #2436CB", UIColor(color: .blue80)),
           ("Blue 90 - #1D289A", UIColor(color: .blue90))
       ]

       let redColors: [(title: String, color: UIColor)] = [
           ("Red 5 - #FFEDE7", UIColor(color: .red5)),
           ("Red 10 - #FFC9BA", UIColor(color: .red10)),
           ("Red 20 - #FFA590", UIColor(color: .red20)),
           ("Red 30 - #FF806B", UIColor(color: .red30)),
           ("Red 40 - #FF5C4C", UIColor(color: .red40)),
           ("Red 50 - #FD3732", UIColor(color: .red50)),
           ("Red 60 - #E1011C", UIColor(color: .red60)),
           ("Red 70 - #C2000F", UIColor(color: .red70)),
           ("Red 80 - #A60008", UIColor(color: .red80)),
           ("Red 90 - #7D0003", UIColor(color: .red90))
       ]
       
       let greenColors: [(title: String, color: UIColor)] = [
           ("Green 5 - #EBF7E7", UIColor(color: .green5)),
           ("Green 10 - #C3E7BA", UIColor(color: .green10)),
           ("Green 20 - #9CD58F", UIColor(color: .green20)),
           ("Green 30 - #75C369", UIColor(color: .green30)),
           ("Green 40 - #50AF47", UIColor(color: .green40)),
           ("Green 50 - #2A9A29", UIColor(color: .green50)),
           ("Green 60 - #00830A", UIColor(color: .green60)),
           ("Green 70 - #006E00", UIColor(color: .green70)),
           ("Green 80 - #005C00", UIColor(color: .green80)),
           ("Green 90 - #004500", UIColor(color: .green90))
       ]

    // MARK: UI Components
    private let table: UITableView = UITableView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = UIColor(color: .backgroundGray)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setUpCollection()
    }
    
    private func setUpCollection() {
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        table.register(ColorCell.self, forCellReuseIdentifier: ColorCell.reuseID)
        
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

// MARK: - UICollectionViewDelegate
extension ColorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constant.TableView.heightForRow
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return setUpHeader(for: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.TableView.headersHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Constant.TableView.headers.count
    }
}

// MARK: - UICollectionViewDataSource
extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return accentColors.count
        case 1:
            return baseColors.count
        case 2:
            return blueColors.count
        case 3:
            return redColors.count
        default:
            return greenColors.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ColorCell.reuseID,
            for: indexPath
        ) as? ColorCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.configure(with: accentColors[indexPath.item].color, title: accentColors[indexPath.item].title)
        case 1:
            cell.configure(with: baseColors[indexPath.item].color, title: baseColors[indexPath.item].title)
        case 2:
            cell.configure(with: blueColors[indexPath.item].color, title: blueColors[indexPath.item].title)
        case 3:
            cell.configure(with: redColors[indexPath.item].color, title: redColors[indexPath.item].title)
        default:
            cell.configure(with: greenColors[indexPath.item].color, title: greenColors[indexPath.item].title)
        }
        
        return cell
    }
}
