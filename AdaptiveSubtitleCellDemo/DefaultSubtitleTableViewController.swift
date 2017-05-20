import UIKit

final class DefaultSubtitleTableViewController : UITableViewController {

    private var sections = [Section]()
    private struct Section {
        var title: String?
        var rows = [Row]()
    }
    private struct Row {
        let cell: Cell
        let data: Any // { SubtitleCellData }
    }
    
    private enum Cell: String {
        case subtitleCell
        
        func identifier() -> String {
            switch self {
            case .subtitleCell: return "AppleSubtitleCell"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Default Subtitle Cell Examples"
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        
        buildTableViewStructure()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (!sections.isEmpty) ? sections[section].title : nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (!sections.isEmpty) ? sections[section].rows.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.cell.identifier(), for: indexPath)
        
        switch row.cell {
        case .subtitleCell:
            let subtitleCell = cell
            let data = row.data as! SubtitleCellData
            subtitleCell.textLabel?.text = data.title
            subtitleCell.detailTextLabel?.text = data.description
            subtitleCell.imageView?.image = data.image
            //subtitleCell.config(withItem: row.data as! SubtitleCellData)
        }
        
        return cell
    }
    
    private func buildTableViewStructure() {
        self.sections = [Section]()
        let smallImage = UIImage(named: "small")
        
        // Section #1
        let row1Data = SubtitleCellData(title: "Park far away and walk", description: "Try it, you'll log many more steps, those spots are easier to find, and you'll avoid door dings", image: smallImage, selectable: true)
        let row1 = Row(cell: Cell.subtitleCell, data: row1Data)
        
        let row2Data = SubtitleCellData(title: "Deserts taste even better after a workout", description: nil, image: smallImage, selectable: true)
        let row2 = Row(cell: Cell.subtitleCell, data: row2Data)
        
        let row3Data = SubtitleCellData(title: "", description: "Don't hit snooze, get up", image: smallImage, selectable: false)
        let row3 = Row(cell: Cell.subtitleCell, data: row3Data)
        
        let section1 = Section(title: "Wellness tips", rows: [row1, row2, row3])
        self.sections.append(section1)
        
        // Section #2
        let largeImage = UIImage(named: "large")
        let row4Data = SubtitleCellData(title: "Exercise vs diet", description: "Is exercise or diet more important for overall health?", image: largeImage, selectable: true)
        let row4 = Row(cell: Cell.subtitleCell, data: row4Data)
        
        let row5Data = SubtitleCellData(title: "Is the sit-stand desk the most innovative invention for improving workplace health?", description: nil, image: largeImage, selectable: true)
        let row5 = Row(cell: Cell.subtitleCell, data: row5Data)
        
        let section2 = Section(title: "Wellness questions", rows: [row4, row5])
        self.sections.append(section2)
        
        // Section #3
        let row6Data = SubtitleCellData(title: "Take the stairs", description: "Start gradually and after several weeks it will get easier", image: nil, selectable: true)
        let row6 = Row(cell: Cell.subtitleCell, data: row6Data)
        
        let row7Data = SubtitleCellData(title: "Skip desert and you may workout less", description: nil, image: nil, selectable: true)
        let row7 = Row(cell: Cell.subtitleCell, data: row7Data)
        
        let row8Data = SubtitleCellData(title: "", description: "Do something for yourself", image: nil, selectable: false)
        let row8 = Row(cell: Cell.subtitleCell, data: row8Data)
        
        let section3 = Section(title: "More wellness tips", rows: [row6, row7, row8])
        self.sections.append(section3)
    }

}
