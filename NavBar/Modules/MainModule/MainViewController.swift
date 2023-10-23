import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var onNext: (() -> Void)?
    
    override func loadView() {
        super.loadView()
        let view = MainView()
        view.onButtonClick = { [weak self] in
            self?.onNext?()
        }
        self.view = view
        
        
    }
}
