import UIKit

class QuizViewController: UIViewController {
    
    var rootView: QuizView {
        view as! QuizView
    }
    var questions: [Question] = []
    var currentQuestionIndex: Int = 0
    var onNext: (() -> Void)?
    
    override func loadView() {
        super.loadView()
        self.view = QuizView()
        rootView.onButtonClick = { [weak self] tag in
            self?.onNext?()
           
            guard let self = self else { return }
            print("onButtonClick \(tag)")
            
            self.currentQuestionIndex += 1
            if self.currentQuestionIndex < self.questions.count {
                let question = self.questions[self.currentQuestionIndex]
                self.rootView.configure(question: question)
            }

        let question = self.questions[self.currentQuestionIndex]
            self.rootView.configure(question: question)
    }
    
  }
}

