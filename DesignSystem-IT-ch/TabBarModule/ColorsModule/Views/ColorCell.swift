//
//  ColorCell.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

final class ColorCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum reuseID {
            static let value = "ColorCell"
        }
        
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum Color {
            static let cornerRadius: CGFloat = 8
            static let dimension: CGFloat = 64
        }
        
        enum Label {
            static let leftOffset: CGFloat = 16
        }
    }
    
    // MARK: - Reuse ID
    static let reuseID = Constant.reuseID.value
    
    // MARK: - UI Components
    private let colorView: UIView = UIView()
    private let label: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - Methods
    func configure(with color: UIColor, title: String) {
        colorView.backgroundColor = color
        label.text = title
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
        
        setUpColorView()
        setUpLabel()
    }
    
    private func setUpColorView() {
        colorView.layer.cornerRadius = Constant.Color.cornerRadius
        
        contentView.addSubview(colorView)
        colorView.pinCenterY(to: contentView.centerYAnchor)
        colorView.pinLeft(to: contentView)
        colorView.setHeight(Constant.Color.dimension)
        colorView.setWidth(Constant.Color.dimension)
    }
    
    private func setUpLabel() {
        label.font = TextStyle.bodyMMedium.font
        label.textColor = UIColor(color: .base0)
        
        contentView.addSubview(label)
        label.pinLeft(to: colorView.trailingAnchor, Constant.Label.leftOffset)
        label.pinCenterY(to: colorView.centerYAnchor)
    }
}
