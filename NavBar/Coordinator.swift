import UIKit

class Coordinator {
    
    private let rootViewController: UIViewController
    private let navigationViewController = UINavigationController()
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.rootViewController.present(navigationViewController, animated: true)
    }
    
    func start() {
        showMainScreen()
    }
    
    private func showMainScreen() {
        let viewController = MainViewController()
        viewController.onNext = { [weak self] in
            self?.showMainScreen2()
        }
        navigationViewController.pushViewController(viewController, animated: true)
    }
    
    private func showMainScreen2() {
        let viewController = MainViewController()
        viewController.onNext = { [weak self] in
            self?.showMainScreen()
        }
        navigationViewController.pushViewController(viewController, animated: true)
    }
}
