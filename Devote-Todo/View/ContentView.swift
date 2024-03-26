//
//  ContentView.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-18.
//

import SwiftUI
import CoreData

struct ContentView: View {

    // MARK: - PROPERTY

    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State var task: String = ""
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    @State private var showNewTaskItem: Bool = false
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    // FETCHING FUNCTON
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // MAIN VIEW
                VStack {
                    // MARK: - HEADER
                    
                    HStack(spacing: 10){
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading, 4)
                        
                        Spacer()
                        
                        EditButton()
                            .font(.system(size:16, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth: 70, minHeight: 24)
                            .background(
                                Capsule().stroke(Color.white, lineWidth: 2)
                            )
                        
                        Button(action: {
                            
                            isDarkMode.toggle()
                            
                        }, label: {
                            Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .font(.system(.title, design: .rounded))
                            
                            
                        })
                            
                    }//: HSTACK
                    .padding()
                    .foregroundColor(.white)
                    
                    VStack{
                        
                    }.frame(height: 60)
                    
                    // MARK: - NEW TASK BUTTON
                    Button(action:{
                        
                        showNewTaskItem = true
                        
                    }, label: {
                        
                        Image(systemName: "plus.circle")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [
                            Color.pink, Color.blue
                        ]),
                    startPoint: .leading, endPoint: .trailing)
                    .clipShape(Capsule())
                    )
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x:0.0, y: 4.0)
                 
                    
                    // MARK: - TASKS
                    
                    List {
                        ForEach(items) { item in
                            ListRowItemView(item: item)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .frame(height: 300)
                    .listStyle(.inset)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.vertical)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    
                    Spacer()
                   

                }//: VSTACK
                .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5))
                
                if showNewTaskItem{
                    BlankView(
                        backgroundColor: isDarkMode ? Color.black : Color.gray,
                        backroundOpacity: isDarkMode ? 0.3 : 0.5 )
                        .onTapGesture{
                            withAnimation(){
                                showNewTaskItem = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
                
                
            }//: ZSTACK
            .onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Tasks", displayMode: .large)
            .navigationBarHidden(true)
//            .toolbar {
//            #if os(iOS)
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//            #endif
//            }//: TOOLBAR
            .background(
                BackgroundImageView().blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
            )
        }//: NAVIGATION VIEW
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}



#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
