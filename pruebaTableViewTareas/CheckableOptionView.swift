//
//  CheckableOptionView.swift
//  pruebaTableViewTareas
//
//  Created by APPS2M on 20/1/22.
//

import UIKit

class CheckableOptionView: UIView
{
    init(index: Int)
    {
        super.init(frame: .zero)
        initializeView(index: index)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var checkableButton: UIButton!
    private var labelOption: UILabel!
    private let buttonTag: Int = 8080
    
    private func initializeView(index: Int)
    {
        checkableButton = UIButton(type: .custom)
        checkableButton.tag = buttonTag + index
        
        
        checkableButton.setImage(UIImage(named: "unchecked"), for: .normal)
        checkableButton.setImage(UIImage(named: "checked"), for: .selected)
        
        checkableButton.addTarget(self, action: #selector(optionSelected(sender:)), for: .touchUpInside)
        
        labelOption = UILabel()
        labelOption.numberOfLines = 0
        labelOption.lineBreakMode = .byWordWrapping
        
        addSubview(checkableButton)
        addSubview(labelOption)
        
        translatesAutoresizingMaskIntoConstraints = false
        checkableButton.translatesAutoresizingMaskIntoConstraints = false
        labelOption.translatesAutoresizingMaskIntoConstraints = false
        
        //Height = 30
        checkableButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
         
        //Width = 30
        checkableButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
         
        //Leading = 8
        checkableButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
         
        //Vertically center
        centerYAnchor.constraint(equalTo: checkableButton.centerYAnchor).isActive = true
        
        //Lable leading = button trailing + 8
        labelOption.leadingAnchor.constraint(equalTo: checkableButton.trailingAnchor, constant: 8).isActive = true
         
        //Top = 8
        labelOption.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
         
        //Trailing = 8
        trailingAnchor.constraint(equalTo: labelOption.trailingAnchor, constant: 8).isActive = true
         
        //Bottom = 8
        bottomAnchor.constraint(equalTo: labelOption.bottomAnchor, constant: 8).isActive = true
    }
    
    
    
    
    
    //To mark an option selected
    public var selected: Bool = false {
        didSet {
           setSelected(selected: selected)
        }
    }
     
    //To set the option text
    public var optionText: String = "" {
        didSet {
           setOptionText(text: optionText)
        }
    }
     
    //To get the index of the option
    public var option: Int {
        get {
            return checkableButton.tag - buttonTag
        }
    }
     
    //To set whether option can be selected or not
    public var optionSelectable: Bool = true {
        didSet {
           if !optionSelectable {
              checkableButton.isSelected = false
           }
        }
    }
    
    public func setOptionText(text: String) {
        labelOption.text = text
    }
     
    public func setSelected(selected: Bool) {
        if !optionSelectable {
           return
        }
     
        if selected {
           checkableButton.isSelected = true
        } else {
           checkableButton.isSelected = false
        }
    }
    
    
    @objc private func optionSelected(sender: UIButton)
    {
     
        if !optionSelectable {
           return
        }
     
        if !sender.isSelected {
           sender.isSelected = true
     
           //Call delegate method
           delegate?.checkableOptionView(option: sender.tag - buttonTag)
        }
    }
}
public protocol CheckableOptionViewDelegate: AnyObject
{
    func checkableOptionView(option: Int)
}
 
public weak var delegate: CheckableOptionViewDelegate?
