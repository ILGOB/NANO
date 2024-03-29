//
//  CreateNewPlaylistView.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/03.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class CreateNewPlaylistView: UIView, ContentViewDelegating {
    
    //MARK: - Declaration
    weak var delegate: ContentViewDelegate?
    private let disposebag = DisposeBag()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새 예약목록"
        label.textColor = .main
        label.font = UIFont.mainTitle
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var textField: UnderLineTextField = {
        let textField = UnderLineTextField()
        textField.placeholder = "제목"
        textField.borderStyle = .none
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.returnKeyType = .done
        
        return textField
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.configuration = UIButton.cancelConfig
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.sizeToFit()
        
        button.rx.tap.subscribe(onNext: { [weak self] in
            self?.delegate?.dismissViewController()
        }).disposed(by: disposebag)
        
        return button
    }()
    
    private lazy var createButton: MainButton = {
        let button = MainButton(title: "예약목록 생성")
        
        button.rx.tap.subscribe(onNext: { [weak self] in
            self?.delegate?.dismissViewController()
            //FIXME: - 서버에 새로운 플레이리스트를 추가해주는 로직
        }).disposed(by: disposebag)
        
        return button
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.endEditing(true)
    }
}

extension CreateNewPlaylistView {
    
    //MARK: - Function
    private func setUpViews() {
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(calculatingHeight(height: 5))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 15))
        }
        
        self.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(calculatingHeight(height: 50))
            make.horizontalEdges.equalToSuperview().inset(calculatingWidth(width: 30))
        }
        
        self.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(calculatingHeight(height: 60))
            make.left.equalToSuperview().offset(calculatingWidth(width: 80))
            make.bottom.equalToSuperview().inset(calculatingHeight(height: 25))
        }
        
        self.addSubview(createButton)
        createButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(calculatingHeight(height: 60))
            make.bottom.equalToSuperview().inset(calculatingHeight(height: 25))
            make.left.equalTo(cancelButton.snp.right).offset(calculatingWidth(width:10))
            make.right.equalToSuperview().inset(calculatingWidth(width: 10))
        }
    }
}

extension CreateNewPlaylistView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
