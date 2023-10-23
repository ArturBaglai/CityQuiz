import Foundation
import UIKit

class Manager {
    var points: Int
    let view: UIStackView
    
    
    init (points: Int, view: UIStackView) {
        self.points = points
        self.view = view
    }
    /*
    func checkUserUnswer(view: UIStackView, userUnswer: String, trueUnswer: Int) {
        switch view.tag {
            case 0:
            var userUnswer = view.tag.description
            case 1:
            var userUnswer = view.tag.description
            case 2:
            var userUnswer = view.tag.description
            case 3:
            var userUnswer = view.tag.description
            
        }
      
    }
     */
    
    func findIndex(array: [String], word: String) -> Int {
        for i in array.indices {
            if (array[i]==word) {
                return i
            }
        }
        return -1
    }
    func findTrueUnswer(array: [Int], trueUnswer: Int) -> Int {
        for i in array.indices {
            if (i==trueUnswer) {
                return array[i]
            }
        }
        return 0
    }
}
