//
//  TabBar.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 12.03.2025.
//

import UIKit

final class MainTabBarController: UITabBarController {
    // MARK: - Constants
    private enum Constant {
        enum Components {
            static let title: String = "Components"
            static let imageName: String = "Components"
            static let selectedImage: String = "ComponentsFill"
            static let tag: Int = 1
        }
        
        enum TextStyles {
            static let title: String = "TextStyle"
            static let imageName: String = "TextStyle"
            static let selectedImage: String = "TextStyleFill"
            static let tag: Int = 2
        }
        
        enum Colors {
            static let title: String = "Colors"
            static let imageName: String = "Colors"
            static let selectedImage: String = "ColorsFill"
            static let tag: Int = 3
        }
        
        enum Border {
            static let origin: CGPoint = CGPoint(x: 0, y: 0)
            static let height: CGFloat = 1
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - SetUp
    private func setUp() {
        setUpAppearance()
        setUpControllers()
    }
    
    private func setUpAppearance() {
        tabBar.backgroundColor = UIColor(color: .tabBar)
        tabBar.barTintColor = UIColor(color: .tabBar)
        tabBar.unselectedItemTintColor = UIColor(color: .base40)
        tabBar.isTranslucent = false
        
        addTabBarTopBorder()
    }
    
    private func setUpControllers() {
        let componentsViewController = createNavController(
            rootViewController: ComponentsViewController(),
            title: Constant.Components.title,
            imageName: Constant.Components.imageName,
            selectedImage: Constant.Components.selectedImage
        )
        
        let textStylesViewController = createNavController(
            rootViewController: TextStylesViewController(),
            title: Constant.TextStyles.title,
            imageName: Constant.TextStyles.imageName,
            selectedImage: Constant.TextStyles.selectedImage
        )
        
        let colorsViewController = createNavController(
            rootViewController: ColorsViewController(),
            title: Constant.Colors.title,
            imageName: Constant.Colors.imageName,
            selectedImage: Constant.Colors.selectedImage
        )
        
        setViewControllers([componentsViewController, textStylesViewController, colorsViewController], animated: false)
    }
    
    private func createNavController(
        rootViewController: UIViewController,
        title: String,
        imageName: String,
        selectedImage: String
    ) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: imageName),
            selectedImage: UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        )
        
        return navController
    }
    
    private func addTabBarTopBorder() {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(
            origin: Constant.Border.origin,
            size: CGSize(width: tabBar.frame.width, height: Constant.Border.height)
        )
        
        borderLayer.backgroundColor = UIColor(color: .base80).cgColor
        tabBar.layer.addSublayer(borderLayer)
    }
}
