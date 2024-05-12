import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    var countries = Set<String>()
    var streak = 0
    var correctAnswer = 0
    var bestStreak = 0
    
    // MARK: Outlets
    // чтобы избежать повторений кода, где для каждой button одно и то же прописывается, я решила использовать Collections
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var bestStreakLabel: UILabel!
    @IBOutlet var streakLabel: UILabel!
    
    // MARK: Actions
    @IBAction func buttonsActions(_ sender: UIButton) {
        let isRightAnswer = sender.tag == correctAnswer
        
        sender.layer.shadowColor = isRightAnswer ? UIColor.systemGreen.cgColor : UIColor.systemRed.cgColor
        
        streak = isRightAnswer ? streak+1 : 0
        streakLabel.text = "Your current streak is \(streak)"
        if streak > bestStreak {
            updateBestScore(newScore: streak)
        }
        askNewQuestion()
        
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bestStreak = readBestScore()
        bestStreakLabel.text = "Your best score is \(bestStreak)"
        
        loadCountries()
        customButtons()
        setFlags()
    }

    // мне не понравилась реализация добавления стран в массив путем их написания напрямую, посколько на практике это редко применяется, ведь вдруг я захочу добавить еще страны, придется менять не только файлы в Assets, но еще и код. вариант с доп. папкой не намного лучше, но пока только так умею) если вдруг есть предложения получше, welcome!
    func loadCountries() {
        // FileManager - директория документов, а Bundle - директория проекта
        let fm = FileManager.default
        let countriesPath = Bundle.main.resourcePath!
        let countriesNames = try! fm.contentsOfDirectory(atPath: countriesPath)
        
        for countryName in countriesNames {
            if countryName.hasSuffix(".png") {
                let country = countryName.split(separator: "@").first!
                countries.insert(String(country))
            }
        }
    }
    
    func customButtons() {
        for button in buttons {
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 0.5
            // сделала доп параметры для кастомизации кнопок
            button.layer.shadowColor = UIColor.lightGray.cgColor
            button.layer.shadowOpacity = 0.8
            button.layer.shadowRadius = 7
            button.layer.shadowOffset = CGSize(width: 0, height: 1)
        }
        setFlags()
    }
    
    func setFlags() {
        var countriesArray = Array(countries)
        countriesArray.shuffle()
        var buttonCounter = 0
        for button in buttons {
            button.setImage(UIImage(named: countriesArray[buttonCounter]), for: .normal)
            buttonCounter += 1
        }
        askQuestion(countriesArray)
    }
    
    // разделила установку флага и вопрос на разные функции
    func askQuestion(_ countriesArray: [String]) {
        correctAnswer = Int.random(in: 0...2)
        title = countriesArray[correctAnswer].uppercased()
        
    }
    
    func askNewQuestion() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.customButtons()
        }
    }
    
    // решила добавить лучший результат пользователя, хранимый в json
    // хороший видос по этому: https://yandex.ru/video/preview/1583116780268602069
    // потом я узнала о такой вещи как UserDefaults, и решила использовать ее, так как JSON каждый раз сбрасывался
    func readBestScore() -> Int {
//        if let fileLocation = Bundle.main.url(forResource: "BestScore", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: fileLocation)
//                let dataFromJson = try JSONDecoder().decode([Score].self, from: data)
//                
//                let bestScore = dataFromJson.first?.bestScore
//                return bestScore!
//                
//            } catch {
//                print(error)
//            }
//        } else {
//            print("cant get the file location")
//        }
//        return 0
        if let bestScore = UserDefaults.standard.value(forKey: "BestScore") as? Int {
            return bestScore
        } else {
            return 0
        }
    }
    
    func updateBestScore(newScore: Int) {
//        bestStreakLabel.text = "Your best score is \(newScore)"
//        bestStreak = newScore
//        if let fileLocation = Bundle.main.url(forResource: "BestScore", withExtension: "json") {
//            do {
//                var dataFromJson = try JSONDecoder().decode([Score].self, from: Data(contentsOf: fileLocation))
//                
//                if var firstScore = dataFromJson.first {
//                    firstScore.bestScore = newScore
//                    dataFromJson[0] = firstScore
//                    
//                    let updatedData = try JSONEncoder().encode(dataFromJson)
//                    try updatedData.write(to: fileLocation)
//                }
//                
//            } catch {
//                print(error)
//            }
//        } else {
//            print("cant get the file location")
//        }
        bestStreakLabel.text = "Your best score is \(newScore)"
        bestStreak = newScore
        UserDefaults.standard.set(newScore, forKey: "BestScore")
    }
}

