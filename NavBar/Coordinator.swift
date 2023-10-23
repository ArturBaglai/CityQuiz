import UIKit

class Coordinator {
    
    private let rootViewController: UIViewController
    private let navigationViewController = UINavigationController()
    private var question: Question {
        generateQuestion()
    }
    
    
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
            self?.generateQuestion()
            self?.showQuestion(question: self!.question)
        }
        navigationViewController.pushViewController(viewController, animated: true)
    }
    
    private func generateQuestion() -> Question {
        var question: Question
        let service = Service()
        question = service.readJsonData().randomElement()!
        return question
    }
    
    private func showQuestion(question: Question) {
        if question.questionAsked == false {
            question.questionAsked = true
            let viewController = QuizViewController()
            viewController.questions = [question]
            navigationViewController.pushViewController(viewController, animated: true)
            viewController.onNext = { [weak self] in
                self?.showMainScreen()
            }
        } else {
            showMainScreen()
        }
    }
}
