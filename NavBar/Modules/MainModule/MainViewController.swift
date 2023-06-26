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
        print ("Method load View")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Method viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        print ("Method viewWillAppear")
    }
    override func viewWillLayoutSubviews() {
        print ("Method viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
        print ("Method viewDidLayoutSubviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        print ("Method viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print ("Method viewDisappear")
    }
    func viewDidDisappear() {
        print ("Method viewDidDisappear")
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        <#code#>
    }
}
