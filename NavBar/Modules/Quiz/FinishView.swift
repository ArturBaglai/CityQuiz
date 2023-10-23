import Foundation
import UIKit
class FinishView {
    
    private let PointsLabel: UILabel = {
        let view = UILabel()
        view.text = "Your points is:"
        view.backgroundColor = .green
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.numberOfLines = 0
        return view
        
    }()
}
