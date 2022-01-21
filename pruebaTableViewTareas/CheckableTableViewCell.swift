//
//  CheckableTableViewCell.swift
//  pruebaTableViewTareas
//
//  Created by APPS2M on 20/1/22.
//

import UIKit

class CheckableTableViewCell: UITableViewCell
{
    override func awakeFromNib()
    {
        super.awakeFromNib()
        initializeCell()
    }
    
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
    private let headerView = UIView()
    private let footerView = UIView()
    private let headerLabel = UILabel()
    private let footerLabel = UILabel()
    
    private func initializeCell()
    {
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        
        footerLabel.numberOfLines = 0
        footerLabel.lineBreakMode = .byWordWrapping
        
        headerView.addSubview(headerLabel)
        footerView.addSubview(footerLabel)
        
        contentView.addSubview(headerView)
        contentView.addSubview(footerView)
        
        footerView.backgroundColor = UIColor.green
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //headerLabel.top = headerView.top + 8
        headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8).isActive = true
        
        //headerLabel.leading = headerView.leading + 8
        headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8).isActive = true
        
        //headerView.trailing = headerLabel.trailing + 8
        headerView.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 8).isActive = true
        
        //headerView.bottom = headerLabel.bottom + 8
        headerView.bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8).isActive = true
        
        //headerView.leading = contentView.leading + 8
        headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        
        //headerView.top = contentView.top + 8
        headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        
        //contentView.trailing = headerView.trailing + 8
        contentView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 8).isActive = true
        
        //footerLabel.leading = footerView.leading + 8
        footerLabel.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 8).isActive = true
        
        //footerLabel.top = footerView.top + 8
        footerLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 8).isActive = true
        
        //footerVoew.trailing = footerLabel.trailing + 8
        footerView.trailingAnchor.constraint(equalTo: footerLabel.trailingAnchor, constant: 8).isActive = true
        
        //footerView.bottom = footerLabel.bootom + 8
        footerView.bottomAnchor.constraint(equalTo: footerLabel.bottomAnchor, constant: 8).isActive = true
        
        //footerView.leading = contentView.leading + 8
        footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        
        //contentView.bottom = footerView.bottom + 8
        contentView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: 8).isActive = true
        
        //contentView.trailing = footerView.trailing + 8
        contentView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: 8).isActive = true
        
    }
    
    //Set the options in a question.
    public var options: Array<String> = []
    {
        didSet
        {
            addOptions(options: options)
        }
    }
    
    //Set the selected option index.
    public var selectedOption: Int = -1
    {
        didSet
        {
            setSelectedOption(index: selectedOption)
        }
    }
    
    //Set the question string of the cell.
    public var question: String = ""
    {
        didSet
        {
            headerLabel.text = question
        }
    }
    
    //Set the answer string for that question.
    public var answer: String = ""
    {
        didSet
        {
            footerLabel.text = answer
        }
    }
    
    //Set whether the options are selectable or not.
    public var optionSelectable: Bool = true
    {
        didSet
        {
            setOption(selectable: optionSelectable)
        }
    }
    
    public func setSelectedOption(index: Int)
    {
        //If options are not selectable do nothing.
        if !optionSelectable
        {
            return
        }
        
        // Find all subviews
        for subview in contentView.subviews
        {
            //If it is CheckableOptionView
            if let checkableOptionView = subview as? CheckableOptionView
            {
                //If the option index is equal to given index mark it as selected otherwise mark it as deselected.
                if checkableOptionView.option == index
                {
                    checkableOptionView.selected = true
                }
                else
                {
                    checkableOptionView.selected = false
                }
            }
        }
    }
    public func clearSelection()
    {
        for subview in contentView.subviews
        {
            if let checkableOptionView = subview as? CheckableOptionView
            {
                checkableOptionView.selected = false
            }
        }
    }
    
    public func setOption(selectable: Bool)
    {
        //Find each subview and check if it is of type CheckableOptionView, set the selectability of that view.
        for subview in contentView.subviews
        {
            if let checkableOptionView = subview as? CheckableOptionView
            {
                checkableOptionView.optionSelectable = selectable
            }
        }
    }
    
    public func setBackground(color: UIColor, forOption option: Int)
    {
        for subview in contentView.subviews
        {
            if let checkableOptionView = subview as? CheckableOptionView
            {
                if checkableOptionView.option == option {
                    
                    checkableOptionView.backgroundColor = color
                }
            }
        }
    }
    
    public func setQuestion(question: String)
    {
        headerLabel.text = question
    }
    public func setAnswer(answer: String)
    {
        footerLabel.text = answer
    }
    
    public func showAnswer()
    {
        for constraint in footerView.constraints
        {
            if constraint.firstAnchor == footerView.heightAnchor
            {
                constraint.isActive = false
            }
        }
    }
    
    public func addOptions(options: [String])
    {
        // Store previous option view to add constraints
        var previousView: CheckableOptionView? = nil
        
        var i = 0
        var isFirst = true
        
        // For all options given in the array
        while i < options.count
        {
            // If view is already exist (Due to reusability of  cell)
            if let optionView = contentView.subviews[safe: i+2] as? CheckableOptionView
            {
                //Reset the view with given parameters
                optionView.optionText = options[i]
                optionView.optionSelectable = optionSelectable
                optionView.selected = false
                optionView.backgroundColor = UIColor.white
                previousView = optionView
            }
            else
            { // If view is not available create a new view and add constraints.
                let optionView = CheckableOptionView(index: i)
                optionView.optionText = options[i]
                optionView.delegate = self
                optionView.optionSelectable = optionSelectable
                contentView.addSubview(optionView)
                optionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
                if let previous = previousView
                {
                    if isFirst
                    { // Remove the bottom constraint of previous view with footer view
                        for constraint in contentView.constraints
                        {
                            if constraint.firstAnchor == footerView.topAnchor
                            {
                                constraint.isActive = false
                            }
                        }
                    }
                    
                    // Add top constraint to bottom of previous view
                    optionView.topAnchor.constraint(equalTo: previous.bottomAnchor).isActive = true
                }
                else
                {
                    //If previous view is not available then add top constraint to header view’s bottom.
                    optionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8).isActive = true
                }
                
                // Add leading and trailing constraint to content view.
                contentView.trailingAnchor.constraint(equalTo: optionView.trailingAnchor, constant: 8).isActive = true
                optionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
                
                isFirst = false
                previousView = optionView
            }
            i = i + 1
        }
        
        if let previous = previousView
        {
            
            // Add last view’s bottom to top of the footer view.
            footerView.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 8).isActive = true
        }
        
        // Initially hide the footer view (Answer View)
        footerView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        // If there are more view’s than the given options remove them. (Due to reusability of cell).
        while i < contentView.subviews.count - 2
        {
            if let optionView = contentView.subviews[safe: i+2] as? CheckableOptionView
            {
                optionView.removeFromSuperview()
            }
        }
    }
    public weak var delegate: CheckableTableViewCellDelegate?
    
}
protocol CheckableTableViewCellDelegate: AnyObject
{
    func checkableTableViewCell(_ cell: CheckableTableViewCell, option: Int)
}

extension CheckableTableViewCell: CheckableOptionViewDelegate
{
    func checkableOptionView(option: Int)
    {
        //Deselect all other options
        for subview in contentView.subviews
        {
            if let checkableOptionView = subview as? CheckableOptionView
            {
                if checkableOptionView.option != option
                {
                    checkableOptionView.selected = false
                }
            }
        }
        
        // Call delegate method to inform view controller.
        delegate?.checkableTableViewCell(self, option: option)
    }
}

extension Collection where Indices.Iterator.Element == Index
{
    // Return object if present otherwise nil.
    subscript (safe index: Index) -> Iterator.Element?
    {
        return indices.contains(index) ? self[index] : nil
    }
}
