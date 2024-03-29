//
//  MainButton.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/22.
//

import UIKit

final class MainButton: UIButton {
    
    //MARK: - Declaration
    private var title: String
    
    //MARK: - Initialize
    convenience init(title: String) {
        self.init()
        self.title = title
        setUpSubView()
    }
    
    override init(frame: CGRect) {
        self.title = ""
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override var intrinsicContentSize: CGSize {
        
        let newSize: CGSize = .init(width: super.intrinsicContentSize.width + 20, height: super.intrinsicContentSize.height + 30)
        return newSize
    }
}

extension MainButton {
    
    func setUpSubView() {
        self.backgroundColor = .main
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.buttonTitle
    }
}
