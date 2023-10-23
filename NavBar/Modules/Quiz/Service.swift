import Foundation

public class Service {
   public func readJsonData () -> [Question] {
       var  allQuestions: [Question] {
          
           let allQuestions = Bundle.main.decode(type: [Question].self, file: "questions.json")
               return allQuestions
       }
       return allQuestions
    }
}
   

public extension Bundle {
    
    func decode <T: Decodable>(type: T.Type = T.self, file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
                fatalError("Could not find \(file) in bundle.")
            }
        guard let data = try? Data(contentsOf: url) else {
                fatalError("Could not load \(file) from bundle.")
            }
            let decoder = JSONDecoder()
        guard let result = try? decoder.decode(T.self, from: data) else {
                fatalError("Failed to load and decode JSON")
            }
        return result 
    }
}

