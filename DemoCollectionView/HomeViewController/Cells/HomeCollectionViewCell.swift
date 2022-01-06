

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var deleteBtnView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var deleteBtn: UIButton!
}
//MARK: - awakeFromNib
extension HomeCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    
}
//MARK: - Helper
extension HomeCollectionViewCell {
    func setUp()
    {
        cellImg.layer.cornerRadius = 15
        numberView.layer.cornerRadius = 5
        deleteBtnView.layer.cornerRadius = deleteBtnView.frame.height / 2
    }
}
//MARK: - Configure Cell
extension HomeCollectionViewCell {
    func configure(with model: Collection) {
        cellImg.image = model.img
    }
}
//MARK: - Add Button
extension HomeCollectionViewCell {
    @IBAction func pressedDeteteCell(_ sender: Any) {
       
          
        print(Contants.collection)
          
    }
    
    
}
