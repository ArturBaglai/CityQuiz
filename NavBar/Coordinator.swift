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
            self?.showQuiz1()
            
        }
        navigationViewController.pushViewController(viewController, animated: true)
       // navigationViewController.pushViewController(quizViewController, animated: true)
    }
    
    private func showQuiz1() {
        let viewController = QuizViewController()
        viewController.onNext = { [weak self] in
            self?.showQuiz2()
        }
        viewController.questions = [
            .init(
                questionTitle: "Which city is on the picture?",
                answersArray: ["Helsinki", "Tartu","Tampere","Vasa"],
                imageName: "finland",
                questionAsked: false
            )
//            .init(
//                questionTitle: "Which city is on the picture?",
//                answersArray: ["Hamburg", "Tallinn","Boston","Istambul"],
//                imageName: "germany",
//                questionAsked: false
//            ),
//            .init(
//                questionTitle: "Which city is on the picture?",
//                answersArray: ["Riga", "Vinus","Tallinn","London"],
//                imageName: "latvia",
//                questionAsked: false
//            ),
//            .init(
//                questionTitle: "Which city is on the picture?",
//                answersArray: ["Oslo", "Numberg", "sddeqdeq'","cdwcwvwece"],
//                imageName: "norway",
//                questionAsked: false
//            )
            
        ]
        navigationViewController.pushViewController(viewController, animated: true)
        
    }
    
    private func showQuiz2() {
        let viewController = QuizViewController()
        viewController.onNext = { [weak self] in
            self?.showQuiz1()
        }
        viewController.questions = [
  
            .init(
                questionTitle: "Which city is on the picture?",
                answersArray: ["Hamburg", "Tallinn","Boston","Istambul"],
                imageName: "germany",
                questionAsked: false
            )
        ]
        navigationViewController.pushViewController(viewController, animated: true)
        
    }
}
