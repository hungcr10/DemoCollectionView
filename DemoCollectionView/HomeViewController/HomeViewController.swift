
import UIKit

class HomeViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var addBtn: UIButton!
}
//MARK: - LifeCycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        registerCollectionViewCell()
        registerHeaderCollectionView()
        
    }
}
//MARK: - Add Button
extension HomeViewController {
    @IBAction func pressedAddCollection(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
}
//MARK: - Helper
extension HomeViewController {
    private func setUp() {
        mainTextView.text = Contants.titleTextField
        mainTextView.layer.cornerRadius = 15
        addBtn.layer.cornerRadius = 15
    }
    private func registerCollectionViewCell() {
        mainCollectionView.register(UINib(nibName: Contants.nibName, bundle: nil), forCellWithReuseIdentifier: Contants.indentifier)
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
    }
    private func registerHeaderCollectionView() {
        mainCollectionView.register(UINib(nibName: Contants.nibNameHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Contants.headerIdentifier)
    }
}

//MARK: - CollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: Contants.indentifier, for: indexPath) as! HomeCollectionViewCell
        cell.configure(with: Contants.collection[indexPath.row])
        cell.numberLabel.text = "\(indexPath.row + 1 )"
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deleteCell(sender: )), for: .touchUpInside)
        mainCollectionView.reloadItems(at: [indexPath])
        return cell
    }
   @objc func deleteCell(sender: UIButton) {
        let i = sender.tag
        Contants.collection.remove(at: i)
        mainCollectionView.reloadData()
       print(Contants.collection)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Contants.collection.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = mainCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Contants.headerIdentifier, for: indexPath) as! HomeHeaderCollectionView
            header.headerLabel.text = Contants.titleHeaderCollection
            return header
    }
}
//MARK: - CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
//MARK: - CollectionViewFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 30
        let widthItem = width / 2
        return CGSize(width: widthItem, height: widthItem * 1.25)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 50)
    }
}
//MARK: - Imgae Picker
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else
        { return }
        picker.dismiss(animated: true, completion: nil)
        Contants.collection.append(Collection(img: image))
    }
}
