//  If the detailText field isn't necessary just set it to hidden and the titleText will be centered in the UIStackView.

import UIKit

struct SubtitleCellData {
    let title: String
    let description: String?
    let image: UIImage?
    var selectable = true // If the cell is selectable set defaults for accessory view and selection style
}

final class SubtitleCell: UITableViewCell, ConfigurableCell {

    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var titleText: UILabel!
    @IBOutlet var detailText: UILabel!
    
    // Height & width image constraints default to the implicit size of the image. However, you may override these constraints if you need an alternate size at runtime
    @IBOutlet var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet var imageWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet var stackviewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var stackView: UIStackView!
    static let identifier = "SubtitleCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(withItem item: Any) {
        guard let data = item as? SubtitleCellData else { return }
        
        titleText.text = data.title
        if let description = data.description {
            detailText.isHidden = false
            detailText.text = description
        } else {
            detailText.isHidden = true
        }
     
        if let image = data.image {
            leftImage.image = image
            imageWidthConstraint.constant = image.size.width
            imageHeightConstraint.constant = image.size.height
            leftImage.isHidden = false
            separatorInset.left = stackviewLeadingConstraint.constant + imageWidthConstraint.constant + stackView.spacing
        } else {
            leftImage.isHidden = true
            separatorInset.left = stackviewLeadingConstraint.constant //0.0
        }
        
        if data.selectable == true {
            self.accessoryType = .disclosureIndicator
            self.selectionStyle = .default
        } else {
            self.accessoryType = .none
            self.selectionStyle = .none
        }
    }
    
}
