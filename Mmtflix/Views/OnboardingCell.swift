import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderİmage: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    
    func setup(_ slide:Onboarding) {
        self.sliderLabel.text = slide.titleLabel!
        self.sliderİmage.image = slide.image!
    }
}
