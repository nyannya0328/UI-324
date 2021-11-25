//
//  Home.swift
//  UI-324 (iOS)
//
//  Created by nyannyan0328 on 2021/10/11.
//

import SwiftUI

struct Home: View {
    @State var post : [Post] = []
    @State var currentImage : String = ""
    @State var fullPreView : Bool = false
    
    var body: some View {
        TabView(selection: $currentImage) {
            
            ForEach(post){tab in
                
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    
                    Image(tab.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(0)
                        .ignoresSafeArea()
                }
                .ignoresSafeArea()
                .tag(tab.id)
                
                
                
                
            }
            
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onTapGesture {
            
            withAnimation{
                
                fullPreView.toggle()
            }
        }
        .overlay(
        
            HStack{
                
                Text("Scenario Picks")
                    .font(.title2.bold())
                
                
                Spacer()
                
                
                Button {
                    
                    
                } label: {
                    
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.title2)
                    
                    
                    
                }
                

                
                
                
            }
                .padding()
                .foregroundColor(.white)
                .background(BlurView(style: .systemUltraThinMaterialDark).ignoresSafeArea())
                .offset(y: fullPreView ? -150 : 0)
            
            ,alignment: .top
        
        )
        .overlay(
        
        
            ScrollViewReader{proxy in
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing:15){
                        
                        
                        ForEach(post){post in
                            
                            
                            Image(post.postImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(12)
                                .padding(2)
                                .overlay(
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.white,lineWidth: 1)
                                    .opacity(currentImage == post.id ? 1 : 0)
                                
                                )
                                .id(post.id)
                            
                        }
                        
                        
                    }
                    .padding()
                    
                    
                }
                .frame(height: 80)
                .background(BlurView(style: .systemUltraThinMaterialDark).ignoresSafeArea())
                .onChange(of: currentImage, perform: { newValue in
                    
                    withAnimation{
                        
                        proxy.scrollTo(currentImage, anchor: .bottom)
                        
                    
                        
                    }
                    
                })
                
            }
                
                .offset(y: fullPreView ? 150 : 0)
               
            
            ,alignment: .bottom
        
        )
        
        .onAppear {
            for index in 1...12{
                
                post.append(Post(postImage: "p\(index)"))
                
            }
            
            currentImage = post.first?.id ?? ""
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
