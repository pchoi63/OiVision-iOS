//
//  ActionView.swift
//  OiVision
//
//  Created by Patrick Choi on 9/6/23.
//

import SwiftUI
import Vision

struct ActionView: View {
    @State private var imageTaken: UIImage?
    @State private var recTexts = [String]()
    @State private var isLoading = false
    
    func recCardText(){
        print("reading Text")
        let requestHandler = VNImageRequestHandler(cgImage:self.imageTaken!.cgImage!)
        
        let recTextReq = VNRecognizeTextRequest{(request, error) in
            guard let obser = request.results as? [VNRecognizedTextObservation] else {return}
            for observation in obser {
                let recText = observation.topCandidates(1).first!.string
                self.recTexts.append(recText)
            }
            
            }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do{
                try requestHandler.perform([recTextReq])
                self.isLoading = false
            }
            catch{
                print(error)
            }
        }
    }
    
    var pictureTakenView: some View{
        VStack{
            Image(uiImage: self.imageTaken!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            Button(action: {
                self.imageTaken = nil
                self.recTexts = [String]()
            }, label: {
                HStack{
                    Image(systemName: "camera")
                    Text("Retake Photo")
                }
            })
            
//            List {
//                ForEach(self.recTexts, id: \.self) { text in
//                    Text(text) // Assuming `recTexts` is an array of Strings
//                }
//            }
            //let combinedText = recTexts.joined(separator: " ")
            //Text(combinedText)
        }
    }
    
    
    var body: some View {
        VStack{
            if(self.imageTaken == nil){
                CameraView(image:self.$imageTaken)
            }
            
            else{
                if(!self.isLoading){
                    self.pictureTakenView.onAppear{self.recCardText()
                    }
                }
                else{
                    ProgressView()
                }
                
            }
        }
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView()
    }
}
