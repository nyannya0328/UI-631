//
//  AnimatedIcon.swift
//  UI-631
//
//  Created by nyannyan0328 on 2022/08/05.
//

import SwiftUI
import Lottie

struct AnimatedIcon: Identifiable {
    var id = UUID().uuidString
    var tabIcon : Tab
   
    
    var lottieView : AnimationView
}

