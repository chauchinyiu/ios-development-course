import SwiftUI

public struct ExerciseView: View {
    
    public init() {
         
    }
    
    public var body: some View {
        VStack{
 
            Rectangle()
                .foregroundColor(.blue)
                .frame(height: 100)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))

            HStack{
                Rectangle()
                    .foregroundColor(.red)
                    .overlay(
                        Ellipse()
                            .fill(Color.blue)
                            .frame(width: .infinity, height: .infinity)
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                    
                    )
                    
                   
                
                VStack{
                    ZStack(alignment: .leading)  {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(Color.green)
                            .frame(width: .infinity, height: 60)
                            .overlay(
                                Text("Text content")
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 10)
                            
                            )
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 5))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 44, height: 44, alignment: .leading)
                            .padding(.leading,5)
 
                    }
                    
                    ZStack(alignment: .leading)  {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(Color.purple)
                            .frame(width: .infinity, height: 60)
                            .overlay(
                                Text("Text content")
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 10)
                            
                            )
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 5))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 44, height: 44, alignment: .leading)
                            .padding(.leading,5)
 
                    }
                    
                    ZStack(alignment: .leading)  {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(Color.yellow)
                            .frame(width: .infinity, height: 60)
                            .overlay(
                                Text("Text content")
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 10)
                            
                            )
                            .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 5))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 44, height: 44, alignment: .leading)
                            .padding(.leading, 5)
                        
                        
                        
                    }
                }
            }
            
        }
        .background(Color.white)
        .frame(width: 400, height: 400)
        
    }
}
