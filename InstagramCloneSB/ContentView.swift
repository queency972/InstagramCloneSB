//
//  ContentView.swift
//  InstagramCloneSB
//
//  Created by Steve Bernard on 27/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                
                    .navigationBarTitle("Instagram", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {}, label: { Image(systemName: "camera")
                    }), trailing: Button(action: {}, label: { Image(systemName: "paperplane")
                    }))
                    
            }
            .tabItem {
                Image(systemName: "house.fill")
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(Author.all) { author in
                            AuthorStoryView(author: author)
                        }
                    }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                Divider()
                
                ForEach(Post.all) { post in
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            AuthorStoryView(author: post.author, width: 40, showText: false)
                            VStack(alignment: .leading) {
                                Text(post.author.name)
                                    .font(.headline)
                                Text("Paris")
                            }
                            
                            Spacer()
                            Image(systemName: "ellipsis")
                        }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        Divider()
                        Image(post.imageName)
                            .resizable()
                            .scaledToFit()
                        
                        HStack(spacing: 20) {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "heart")
                                    .font(.title)
                            }).buttonStyle(PlainButtonStyle())
                            
                            Button(action: {}, label: {
                                Image(systemName: "bubble.right")
                                    .font(.title)
                            }).buttonStyle(PlainButtonStyle())
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "paperplane")
                                    .font(.title)
                            }).buttonStyle(PlainButtonStyle())
                            Spacer()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "bookmark")
                                    .font(.title)
                            }).buttonStyle(PlainButtonStyle())
                        }.padding()
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Voir les J'aime")
                                .font(.headline)
                        }).buttonStyle(PlainButtonStyle())
                        
                        
                        HStack(alignment: .top) {
                            Text(post.author.name)
                                .font(.headline)
                            Text(post.comment)
                                .lineLimit(nil)
                        }
                        
                        //Text(relativeFormatter.localizedString(for: post.creationDate, relativeTo: Date()))
                            .font(.callout)
                            .foregroundColor(.gray)
                    }.padding(.horizontal)
                }
            }
        }
    }
}

struct AuthorStoryView: View {
    let author: Author
    var width: CGFloat = 70
    var showText = true
    var body: some View {
        VStack {
            Image(author.photoName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: width)
                .overlay(
                    Circle().stroke(Color.red, style: StrokeStyle(lineWidth: 2))
                        .frame(width: width + 5, height: width + 5)
                )
            if showText {
                Text(author.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
