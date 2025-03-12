//
//  TextStyleCell.swift
//  DesignSystem-IT-ch
//
//  Created by Peter on 12.03.2025.
//

import UIKit

final class TextStyleCell: UITableViewCell {
    // MARK: - Constnts
    private enum Constant {
        enum reuseID {
            static let value = "TextStyleCell"
        }
        
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum Label {
            static let text: String = "The quick brown fox jumps over the lazy dog"
            static let numberOfLines: Int = 0
            static let vertcalOffset: CGFloat = 8
        }
    }
    
    // MARK: - Reuse ID
    static let reuseID = Constant.reuseID.value
    
    // MARK: - UI Components
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
    func configure(with textStyle: UIFont) {
        label.font = textStyle
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
        
        setUpLabel()
    }
    
    private func setUpLabel() {
        label.text = Constant.Label.text
        label.textColor = UIColor(color: .base20)
        label.numberOfLines = Constant.Label.numberOfLines
        
        contentView.addSubview(label)
        label.pinHorizontal(to: contentView)
        label.pinVertical(to: contentView, Constant.Label.vertcalOffset)
    }
}
