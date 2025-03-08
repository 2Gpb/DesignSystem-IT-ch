//
//  ColorCell.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 08.03.2025.
//

import UIKit

final class ColorCell: UITableViewCell {
    // MARK: - Reuse ID
    static let reuseID = "ColorCell"
    
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
        fatalError("init(coder:) has not been implemented")
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
        colorView.layer.cornerRadius = 8
        
        contentView.addSubview(colorView)
        colorView.pinCenterY(to: contentView.centerYAnchor)
        colorView.pinLeft(to: contentView)
        colorView.setHeight(64)
        colorView.setWidth(64)
    }
    
    private func setUpLabel() {
        label.font = TextStyle.bodyMMedium.font
        label.textColor = UIColor(color: .base0)
        
        contentView.addSubview(label)
        label.pinLeft(to: colorView.trailingAnchor, 16)
        label.pinCenterY(to: colorView.centerYAnchor)
    }
}
