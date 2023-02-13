//
//  ContentView.swift
//  coredatax
//
//  Created by Bob Bulliard on 4/20/22.
//

import SwiftUI
import CoreData
struct ContentView: View {
    // @State var navigated = true
    var body: some View {
        
        VStack  {
            Image("oil_rig")
                .resizable()
                .frame(width: 385.0, height: 100.0, alignment: .leading)
            //   .scaledToFit()
            //         .ignoresSafeArea()
            
            Divider()
            
            
            
            
            NavigationView{
                List{
                    ScrollView  {
                        
                        
                        Group{
                            
                            Text("scroll slider is to the right------------>")
                                .font(.system(size: 18))
                                .foregroundColor(Color.white)
                                .background(Color.black.cornerRadius(10))
                                .background(RoundedRectangle(cornerRadius: 14))
                            NavigationLink("Pressure Gradient--> ", destination: nextview2())
                            //         .frame(width: 255.0, height: 150.0, alignment: .leading)
                                .modify1()
                            //         Divider()
                            NavigationLink("Hydrostatic Pressure---->", destination: nextview2())
                                .modify1()
                            //     Divider()
                        }
                        Group {
                            Group {
                                NavigationLink("Calculate overbalance  due to falling mud level (wet/dry)->", destination: nextview2())
                                NavigationLink("List view:", destination: listview())
                                //        Divider()
                              //  NavigationLink(“Send data->”, destination: sendit())
                                //        Divider()
                                
                            }
                            //       .frame(width: 300, height: 100, alignment: .leading)
                            
                            .modify1()
                            
                            .navigationBarHidden(true)
                        }
                        
                        
                    }
                    
                    
                }
            }
        }
    }
}
        
        
        struct nextview2: View {
            @State private var amt = ""
            var body: some View {
                VStack{
                    ScrollView{
                        Group{
                            
                            Text("Pressure Gradient - Using Mud Weight, lb/ft³:")
                                .frame(width:380, height: 62, alignment: .leading)
                                .modify3()
                            Text("Enter mud weight/lb/ft³")
                                .frame(width:380, height: 62, alignment: .leading)
                            
                            TextField("Enter mud weight/lb/ft³", text: $amt)
                            
                                .modify1()
                            let amtx = (amt as NSString).doubleValue
                            Text("---------------")
                            Text("PSI/ft: \(psift2(parm1: amtx, parm2: 2))")
                                .frame(width:380, height: 62, alignment: .leading)
                                .modify1()
                        }
                        
                        
                        Spacer()
                    }
                }
            }
        }
        func psift2(parm1: Double, parm2: Double) -> Double {
            var total: Double = 0
            total = parm1 * 0.006944
            return total}
        
        struct nextview3: View   {
            @State private var amt = ""
            var body: some View {
                VStack  {
                    ScrollView{
                        Group{
                            
                            
                            Text("Pressure Gradient - Using specific gravity:")
                                .frame(width:380, height: 62, alignment: .leading)
                                .modify3()
                            Text("Enter mud weight/specific gravity:")
                                .frame(width:380, height: 62, alignment: .leading)
                            TextField("Enter mud weight/specific gravity", text: $amt)
                            
                                .modifier(Modify1())
                            let amtx = (amt as NSString).doubleValue
                            Text("------------")
                            Text("PSI/ft: \(psift3(parm1: amtx, parm2: 2))")
                                .frame(width:380, height: 62, alignment: .leading)
                                .modify1()
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        func psift3(parm1: Double, parm2: Double) -> Double {
            var total: Double = 0
            total = parm1 * 0.433
            return total}
        
        
        struct sendit: View {
            @State var numbertomessage = ""
            @State var message = ""
            var body: some View {
                Text("For problems, issues, law suits or copyright infringements,")
                    .font(.headline)
                Text("please contact Gabriel Bulliard at 3372778386")
                    .font(.headline)
                Text("Thanking you in advance for your help with this..")
                    .font(.headline)
                TextField("Enter a Mobile num:(1xxxxxxxxxx", text: $numbertomessage)
                // keyboardType(.numberPad)
                TextField("Enter a message", text: $message)
                //  keyboardType(.alphabet)
                
                Button("send") {
                    sendmessage(parm1: numbertomessage, parm2: message)
                }
                
                
            }
        }
        
        func sendmessage(parm1: String, parm2: String) {
            //func av4(parm1: Double, parm2: Double, parm3: Double) -> Double {
            let sms: String = "sms:\(parm1)&body=\(parm2)"
            let strurl: String =  sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            UIApplication.shared.open(URL.init(string:strurl)!, options: [:], completionHandler: nil)
        }
        
        
        
        
        
        struct listview: View {
            @Environment(\.managedObjectContext) private var viewContext
            
            @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
                animation: .default)
            private var items: FetchedResults<Item>
            
            var body: some View {
                Text("Medtronics is my WORLD!")
                NavigationView {
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            } label: {
                                Text(item.timestamp!, formatter: itemFormatter)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        ToolbarItem {
                            Button(action: addItem) {
                                Label("Add Item", systemImage: "plus")
                            }
                        }
                    }
                    Text("Select an item")
                }
            }
            
            private func addItem() {
                withAnimation {
                    let newItem = Item(context: viewContext)
                    newItem.timestamp = Date()
                    
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
            }
            
            private func deleteItems(offsets: IndexSet) {
                withAnimation {
                    offsets.map { items[$0] }.forEach(viewContext.delete)
                    
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
                
            }
            private let itemFormatter: DateFormatter = {
                let formatter = DateFormatter()
                formatter.dateStyle = .short
                formatter.timeStyle = .medium
                return formatter
            }()
        }
    

struct Modify1: ViewModifier {
    func body(content: Content) -> some View {
        content
        //  .multilineTextAlignment(.leading)
        //    .frame(width:380, height: 62, alignment: .leading)
            .frame(width:380, height: 30, alignment: .center)
        //     .frame(width:250, height: 42, alignment: .leading)
            .font(.system(size: 11))
            .foregroundColor(Color.black)
            .background(Color.teal.cornerRadius(10))
            .background(RoundedRectangle(cornerRadius: 14))
        //      .background(Color.green)
            .keyboardType(.decimalPad)
        //  .padding(.horizontal,22)
        // .padding(.vertical,1)
        
        
        //    .onTapGesture {self.body(content: KeyboardShortcut)}
        //     .onTapGesture {
        //         self.}
        //   .onTapGesture {
        //               self.endEditing()
        
        
    }
    
    
}
            extension View {
                func modify1() -> some View {
                    modifier(Modify1())
                }
            }
            struct Modify2: ViewModifier {
                func body(content: Content) -> some View {
                    content
                        .frame(width:380, height: 62, alignment: .leading)
                    //   .frame(width:250, height: 42, alignment: .leading)
                        .font(.system(size: 10))
                        .foregroundColor(Color.black)
                        .background(Color.teal.cornerRadius(10))
                        .background(RoundedRectangle(cornerRadius: 14))
                    //      .background(Color.green)
                    //    .keyboardType(.decimalPad)
                    //    .padding(.horizontal,20)
                    //  .padding(.horizontal,20)
                    //  .padding(.vertical,1)
                    
                    
                    //    .onTapGesture {self.body(content: KeyboardShortcut)}
                    //     .onTapGesture {
                    //         self.}
                    //   .onTapGesture {
                    //               self.endEditing()
                    
                    
                }
                
            }
            
            extension View {
                func modify2() -> some View {
                    modifier(Modify2())
                }
            }
            
            struct Modify3: ViewModifier {
                func body(content: Content) -> some View {
                    content
                    
                        .font(.headline)
                    //    Divider()
                    // .bold()
                    
                    //   .padding(.horizontal,20)
                    
                    
                    
                    
                    
                }
                
            }
            
            extension View {
                func modify3() -> some View {
                    modifier(Modify3())
                }
            }
            
            
        
                
            
            
            struct ContentView_Previews: PreviewProvider {
                static var previews: some View {
                    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                }
            }
        
        




