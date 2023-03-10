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
            Image("dr_roth")
                .resizable()
                .frame(width: 150.0, height: 150.0, alignment: .leading)
            
            // width was 180; height was 200
            //   .scaledToFit()
            //         .ignoresSafeArea()
            
            Divider()
            
            
            
            
            NavigationView{
                List{
                    ScrollView  {
                        
                        
                        Group{
                            
                            Text("Always use Dr Roth")
                            
                            Text("(World Class Surgeon)")
                            Text("And Super Nurse Danielle (RN)")
                            Text(" ") }
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .background(Color.black.cornerRadius(10))
                                .background(RoundedRectangle(cornerRadius: 14))
                       
                        Group {
                            
                            NavigationLink("Enter Daily Bladder log -> ", destination: dailylog())
                            //         .frame(width: 255.0, height: 150.0, alignment: .leading)
                                .modify1()
                            //         Divider()
                            
                        }
                        Group {
                            Group {
                               
                                NavigationLink("View Log->", destination: listview())
                                //        Divider()
                              //  NavigationLink(“Send xdata->”, destination: sendit())
                                NavigationLink("Send text message->", destination:sendit())
                                NavigationLink("Build file->", destination:buildfile())
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
        
        
        struct dailylog: View {
            @State private var amt = ""
            @State private var date = ""
            @State private var time = ""
            @State private var accident = ""
            @State private var underwear = ""
            @State private var leak = ""
            @State private var urgency = ""
            @State private var soil = ""
            @State private var void = ""
            @State private var voidamt = ""
            @State private var retamt = ""
            @State private var worked = true
            @Environment(\.managedObjectContext) private var viewContext
            var body: some View {
                VStack{
                    ScrollView{
                        Group{
                            
                            Text("-Daily log-")
                                .frame(width:180, height: 22, alignment: .leading)
                                .modify3()
                            
                            Text("Enter Date")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Date:", text: $date)
                                .modify2()
                        }
                        Group{
                            Text("Enter Time")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Time:", text: $time)
                                .modify2()
                            Text("Accident(Y/n)?")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Accident:", text: $accident)
                                .modify2()
                        }
                        Group{
                            
                            Text("Chg underwear?(y/n)")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Change underwear?", text: $underwear)
                                .modify2()
                            
                            Text("Leak (0,1,2,3)")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Leak (0,1,2,3)", text: $leak)
                                .modify2()
                       
                            Text("Urgency (0,1,2,3,4)")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Urgency (0,1,2,3,4)", text: $urgency)
                                .modify2()
                            
                            Text("Soil (y/n)")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Soil (y/n)", text: $soil)
                                .modify2()
                            
                        }
                        
                        Group{
                            
                            Text("Void?(y/n)")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Void? (y/n)", text: $void)
                                .modify2()
                            
                            Text("Void amt:")
                                .frame(width:180, height: 22, alignment: .leading)
                        }
                        Group{
                            TextField("Void amt?", text: $voidamt)
                                .modify2()
                            
                            Text("Retain amt?")
                                .frame(width:180, height: 22, alignment: .leading)
                            TextField("Retain amt?", text: $retamt)
                                .modify2()
                            
                            
                            
                        }
                        
                        
                        // let amtx = (amt as NSString).doubleValue
                        Text("---------------")
                    }
                    Group{
                          //  Text("PSI/ft: \(psift2(parm1: amtx, parm2: 2))")
                         //       .frame(width:380, height: 62, alignment: .leading)
                          //      .modify1()
                        Text ("--------------")
                        Text ("   ")
                        Button("Click here to add your entry") {
                            addItem2(parm1: date,
                                     parm2: time,
                                    parm3:accident,
                                    parm4:underwear,
                                     parm5:leak,
                                   parm6:urgency,
                                     parm7:soil,
                            parm8:void,
                                    parm9:voidamt,
                                     parm10:retamt)
                        }
                        
                        }
                        Spacer()
                   
                    }
                }
            // func sendmessage(parm1: String, parm2: String) {
            
            private func addItem2( parm1: String, parm2: String, parm3: String, parm4: String, parm5: String, parm6: String, parm7: String ,
                                   parm8: String, parm9: String, parm10: String  ) {
                withAnimation {
                    let newItem2 = Item2(context: viewContext)
                 
                //    newItem.timestamp = Date()
                    newItem2.c_date = parm1
                    newItem2.c_time = parm2
                    newItem2.c_accident = parm3
                    newItem2.c_underwear = parm4
                    newItem2.c_leak = parm5
                    newItem2.c_urgency = parm6
                    newItem2.c_soil = parm7
                    newItem2.c_void = parm8
                    newItem2.c_voidamt = parm9
                    newItem2.c_retamt = parm10
                     worked = true
                    do {
                        try viewContext.save()
                    } catch {
                        worked = false
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                   
                    }
                    
                  
                }
                
            }
            

            }
        
        func psift2(parm1: Double, parm2: Double) -> Double {
            var total: Double = 0
            total = parm1 * 0.006944
            return total}
        
struct buildfile: View   {
    @State private var amt = ""
    var body: some View {
        VStack  {
            ScrollView{
                Group{
                    
                    
                    Text("building file:")
                        .frame(width:380, height: 62, alignment: .leading)
                    
            //        Text("Enter mud weight/specific gravity:")
             ////           .frame(width:380, height: 62, alignment: .leading)
              //      TextField("Enter mud weight/specific gravity", text: $amt)
                    
                    
              //      let amtx = (amt as NSString).doubleValue
                    Text("------------")
                //    Text("PSI/ft: \(psift3(parm1: amtx, parm2: 2))")
                //        .frame(width:380, height: 62, alignment: .leading)
                    
                    let workedx = createfile(parm1: 1, parm2: 1)
                    if workedx == true {
                        Text(" file status of create: worked")
                     //   writeFile(outputFile: "xtest", stringData: "test")
                    } else {
                        Text("file status of create: bad")
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
 
func createfile(parm1: Double, parm2: Double) -> Bool {
  
    var worked = true
 /*   let filePath = NSHomeDirectory() + "/bobtest.txt"
    if (FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)) {
        print("File created successfully.")
    } else {
        worked = false
        print("File not created.")
    }*/
    let filePath = NSHomeDirectory() + "/Documents/" + "xtest.txt"
    if (FileManager.default.createFile(atPath: filePath, contents: nil, attributes: nil)) {
        print("File created successfully.")
        writeFile(outputFile: "xtest", stringData: "test")
    } else {
        worked = false 
        print("File not created.")
    }
    
  
    return worked}

func writeFile(outputFile:String, stringData: String) {

  //  let fileExtension = outputFile.fileExtension()
//let fileName = outputFile.fileName()
  let fileExtension = "txt"
    let fileName = outputFile
let fileURL = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor:nil,create: true)
let outputFile = fileURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)

    guard let data = stringData.data(using: .utf8) else {
    print("unable to convert string to data")
return
}
do{
try data.write(to: outputFile)
print ("data written: \(data) ")

}
    catch
    {
    print(error.localizedDescription)
}
}



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
                Text("For HIPPA law violations, problems, issues, law suits or copyright infringements,")
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
        
        
        
        //
//
//
//   once you make changes to core data file, you must do a navigate/project/ clean build..
//   or you'll get error when trying to read the data.
//
        
        struct listview: View {
            @Environment(\.managedObjectContext) private var viewContext
            // got sort working w 2 keys
            @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \Item2.c_date, ascending: true),
                                  NSSortDescriptor(keyPath: \Item2.c_time, ascending: true)
                                 ],
                animation: .default)
            private var items: FetchedResults<Item2>
            
            var body: some View {
                Text("Medtronics is my WORLD!")
                NavigationView {
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                //Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                               Text("Item Date: \(item.c_date!) ")
                                Text("Item Time: \(item.c_time!) ")
                               Text("Accident? \(item.c_accident!)")
                                Text("Leak? \(item.c_leak!)")
                                Text("Soil? \(item.c_soil!)")
                               Text("change underwear? \(item.c_underwear!)")
                               Text("Urgency? \(item.c_urgency!)")
                               Text("voided? \(item.c_void!)")
                                Text("Void Amt: \(item.c_voidamt!)")
                                Text("Retain Amt: \(item.c_retamt!)")
                               
                                
                            } label: {
                              //Text(item.timestamp!, formatter: itemFormatter)
                                Text("Log Date-Time \(item.c_date!) - \(item.c_time!)")
                        
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
                    let newItem = Item2(context: viewContext)
                    newItem.timestamp2 = Date()
                    
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
            .frame(width:300, height: 60, alignment: .center)
        //     .frame(width:250, height: 42, alignment: .leading)
            .font(.system(size: 22))
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
                  //      .frame(width:260, height: 52, alignment: .leading)
                    // was 380 62
                    //   .frame(width:250, height: 42, alignment: .leading)
                        .font(.system(size: 22))
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
        
        




