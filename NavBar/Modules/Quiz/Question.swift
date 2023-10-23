public class Question: Equatable, Decodable {
    
    
    var questionId: Int
    var questionPoints: Int
    var questionTitle: String
    var answersArray: [String]
    var imageName: String
    var questionAsked: Bool
    var trueUnswer: Int
    
    public init (questionId: Int,
                 questionPoints: Int,
                 questionTitle: String,
                 answersArray: [String],
                 imageName: String,
                 questionAsked: Bool,
                 trueUnswer: Int
                )
    {
        self.questionId = questionId
        self.questionPoints = questionPoints
        self.questionTitle = questionTitle
        self.answersArray = answersArray
        self.imageName = imageName
        self.questionAsked = questionAsked
        self.trueUnswer = trueUnswer
    }
    public static func == (lhs: Question, rhs: Question) -> Bool {
        return
        lhs.questionId == rhs.questionId
        lhs.questionPoints == rhs.questionPoints
        lhs.questionTitle == rhs.questionTitle
        lhs.answersArray == rhs.answersArray
        lhs.imageName == rhs.imageName
        lhs.questionAsked == rhs.questionAsked
    }
}
