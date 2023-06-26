import UIKit

class MainView: UIView {
    
    var onButtonClick: (() -> Void)?
    
    private let title: UILabel = {
        let view = UILabel()
        view.text = "MyLABEL"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 50, weight: .bold)
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Description asdf asdf asdf asd fasdf  asdfasdfasa asd fasdf sd "
        view.backgroundColor = .green
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.numberOfLines = 0
        return view
        
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Next", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupInitialLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInitialLayout() {
        
        self.addSubview(title)
        title.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.addSubview(descriptionLabel)
        descriptionLabel.setContentHuggingPriority(.init(rawValue: 999), for: .horizontal)
        descriptionLabel.setContentCompressionResistancePriority(.init(rawValue: 999), for: .horizontal)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.leading.greaterThanOrEqualToSuperview().inset(5)
            $0.trailing.lessThanOrEqualToSuperview().inset(5)
        }
        
        self.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc func onClick() {
        onButtonClick?()
    }
}
