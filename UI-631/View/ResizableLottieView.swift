//
//  ResizableLottieView.swift
//  UI-631
//
//  Created by nyannyan0328 on 2022/08/05.
//

import SwiftUI
import Lottie

struct ResizableLottieView: UIViewRepresentable {
    
    var lottieView : AnimationView
    var color : SwiftUI.Color = .black
    
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        setUp(to: view)
        return view
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
        if let animationView = uiView.subviews.first(where: { view in
            view is AnimationView
        }) as? AnimationView{
            lottieView.logHierarchyKeypaths()
            let fileKeyPath = AnimationKeypath(keys: ["**","Fill 1","**","Color"])
            let lottiColor = ColorValueProvider(UIColor(color).lottieColorValue)
            animationView.setValueProvider(lottiColor, keypath: fileKeyPath)
            
            let strokePath = AnimationKeypath(keys: ["**","Stroke 1","**","Color"])
            animationView.setValueProvider(lottiColor, keypath: strokePath)
            
          
        }
        
    }
    
    func setUp(to : UIView){
        
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.contentMode = .scaleAspectFit
        lottieView.backgroundColor = .clear
        
        let contains = [
        
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        
        
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(contains)
        
        
        
        
    }
    
}
