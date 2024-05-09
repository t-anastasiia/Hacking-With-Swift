import UIKit

class DetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var imageView: UIImageView!
    
    // MARK: Properties
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    // MARK: Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        loadImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // MARK: Methods
    func loadImage() {
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    func setUI() {
        title = "image \(selectedPictureNumber)"
        navigationItem.largeTitleDisplayMode = .never
    }

}
