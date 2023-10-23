import UIKit
import SnapKit

class QuizView: UIView {
    
    var onButtonClick: ((Int) -> Void)?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let questionTitleLabel: UILabel = {
        let questionTitleLabel = UILabel()
        questionTitleLabel.textAlignment = .center
        return questionTitleLabel
    }()
    
    lazy var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 8
            return stackView
        }()
        
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        setupInitialLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(question: Question) {
        
        imageView.image = UIImage(named: question.imageName)
        questionTitleLabel.text = question.questionTitle
        
        stackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
            stackView.removeArrangedSubview(view)
        }
        
        for unswer in question.answersArray.enumerated() {
            let buttonView = UIButton()
            buttonView.backgroundColor = .black
            buttonView.setTitle(unswer.element, for: .normal)
            buttonView.layer.cornerRadius = 9
            buttonView.addTarget(self, action: #selector(onClick), for: .touchUpInside)
            buttonView.tag = unswer.offset
            stackView.addArrangedSubview(buttonView)
        }
    }
    
    private func setupInitialLayout() {
        
        addSubview(imageView)
        addSubview(questionTitleLabel)
        addSubview(stackView)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        questionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(questionTitleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc func onClick(sender: UIButton) {
        onButtonClick?(sender.tag)
    }
}
