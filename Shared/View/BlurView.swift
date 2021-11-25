//
//  BlurView.swift
//  UI-324 (iOS)
//
//  Created by nyannyan0328 on 2021/10/11.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    let style : UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
        
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}


