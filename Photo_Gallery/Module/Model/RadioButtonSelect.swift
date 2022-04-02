//
//  RadioButtonSelect.swift
//  Photo_Gallery
//
//  Created by Ahmad Mustafa on 02/04/2022.
//

import UIKit

class GridRadioButtonSelect: UIButton{
    enum SelectAction{
        case select
        case nonSelect
    }
    
    var selectAction: SelectAction{
        didSet{
            updateImage()
        }
    }
    
    init(selectAction: SelectAction){
        self.selectAction = selectAction
        super.init(frame: .zero)
        setTitle("", for: .normal)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateImage(){
        switch selectAction{
        case .select:
            setImage(UIImage(named: "Vector-1"), for: .normal)
        case .nonSelect:
            setImage(UIImage(named: "Vector-3"), for: .normal)
        }
    }
}

class ListRadioButtonSelect: UIButton{
    enum SelectAction{
        case select
        case nonSelect
    }
    
    var selectAction: SelectAction{
        didSet{
            updateImage()
        }
    }
    
    init(selectAction: SelectAction){
        self.selectAction = selectAction
        super.init(frame: .zero)
        setTitle("", for: .normal)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateImage(){
        switch selectAction{
        case .select:
            setImage(UIImage(named: "Vector"), for: .normal)
        case .nonSelect:
            setImage(UIImage(named: "Vector-2"), for: .normal)
        }
    }
}
