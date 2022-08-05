//
//  MainView.swift
//  UI-631
//
//  Created by nyannyan0328 on 2022/08/05.
//

import SwiftUI
import Lottie

struct MainView: View {
    @State var currentTab : Tab = .home
    @Environment(\.self) var env
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var animatedIcons : [AnimatedIcon] = {
    
        var tabs : [AnimatedIcon] = []
            
            for tab in Tab.allCases{
              
                
            
                tabs.append(.init(tabIcon: tab, lottieView: AnimationView(name: tab.rawValue,bundle: .main)))
                
                
            }
            return tabs
    
            }()
    var body: some View {
        VStack(spacing:0){
            
            TabView(selection: $currentTab) {
                
                Text("Home")
                    .BG()
                    .tag(Tab.home)
                
                Text("Message")
                    .BG()
                    .tag(Tab.chat)
                
                
                Text("Notification")
                    .BG()
                    .tag(Tab.notifications)
                
                Text("Saved")
                    .BG()
                    .tag(Tab.saved)
                
                Text("Profile")
                    .BG()
                    .tag(Tab.account)
                
            }
            
            if #available(iOS 16, *){
                
                TabBar()
                    .toolbar(.hidden, for: .tabBar)
                
                
            }
            else{
                
                TabBar()
                
            }
        }
    }
    @ViewBuilder
    func TabBar()->some View{
        
        
        HStack(spacing:0){
            
            ForEach(animatedIcons){icon in
                VStack{
                    
                    
                    let tabColor : SwiftUI.Color = currentTab == icon.tabIcon ? (env.colorScheme == .dark ? Color.white : Color.red) : .gray.opacity(0.6)
                    
                    ResizableLottieView(lottieView: icon.lottieView,color:tabColor)
                        .aspectRatio(contentMode: .fit)
                         .frame(width: 30,height: 30)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            
                            currentTab = icon.tabIcon
                            icon.lottieView.play{_ in}
                            
                        }
                    
                    Text(currentTab.rawValue)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(tabColor)
                        .opacity(currentTab == icon.tabIcon ? 1 : 0)
                    
                
                    
                    
                }
                
                
            }
        }
        .padding(.vertical,10)
        .padding(.horizontal)
        .background{
         
            (env.colorScheme == .dark ? Color.black : Color.white)
        }
        
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    @ViewBuilder
    func BG()->some View{
        
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background{
             
                Color.primary
                    .opacity(0.05)
                    .ignoresSafeArea()
                   
            }
            
    }
}
