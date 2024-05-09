import UIKit

class ViewController: UITableViewController {
    
    // MARK: Properties
    var pictures = [String]()

    // MARK: Lide Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        getImages()
    }
    
    // MARK: Override methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    // переопределение родительского метода для обработки выбора ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // создает новый экземпляр view controller, который определен в сториборде (Storyboard) с идентификатором "Detail". instantiateViewController(withIdentifier:) - это метод, который используется для создания экземпляра контроллера представления из сториборда по его идентификатору.
            vc.selectedImage = pictures[indexPath.row]
            //        // indexPath.row - это индекс строки, которая была выбрана пользователем.
            navigationController?.pushViewController(vc, animated: true)
            //  Эта строка переключает (pushes) контроллер представления vc на вершину стека навигации. Если текущий контроллер представления находится внутри UINavigationController, это приведет к отображению контроллера vc на экране с анимацией (если animated установлено в true).
        }
    }
    
    // MARK: Methods
    func setUI() {
        title = "Cats Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getImages() {
        let fm = FileManager.default //Эта строка создает экземпляр FileManager, который используется для взаимодействия с файловой системой
        let path = Bundle.main.resourcePath! //Эта строка получает путь к ресурсам приложения в рамках его пакета (Bundle)
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }

}

