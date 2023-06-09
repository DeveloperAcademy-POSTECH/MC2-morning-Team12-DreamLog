//
//  ViewExtension.swift
//  mc2-DreamLog
//
//  Created by ChoiYujin on 2023/05/04.
//

import SwiftUI

extension View {
    
    func brownText(fontSize: CGFloat = 22) -> some View {
        modifier(TextBrownModifier(fontSize: fontSize))
    }
    
    func brownButton(isActive: Bool = true) -> some View {
        modifier(ButtonBrownModifier(isActive: isActive))
    }
    func whiteWithBorderButton() -> some View {
        modifier(ButtonWhiteBoldModifier())
    }
    
    func grayText(fontSize: CGFloat = 18) -> some View {
        modifier(TextGrayModifier(fontSize: fontSize))
    }
    
    func menuButton() -> some View {
        modifier(MenuButtonModifier())
    }
    
    // This function changes our View to UIView, then calls another function
    // to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        // here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
    
    func dateConverter(inputDateString: String) -> String {
        
        var dateString = inputDateString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateString = dateFormatter.string(from: date!)
        
        let calendar = Calendar.current
        let updatedDate = calendar.date(byAdding: .hour, value: 9, to: date!)
        
        let updatedDateString = dateFormatter.string(from: updatedDate!)
        
        return updatedDateString
    }
}

