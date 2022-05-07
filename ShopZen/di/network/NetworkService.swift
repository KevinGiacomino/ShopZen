//
//  NetworkService.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/***/
class NetworkService : NSObject
    {
    
    private let decoderHandler : DecoderHandler?

    override init()
        {
        decoderHandler          = DecoderHandler()
        }
    
    /***/
    func fetchListOfItems(completion : @escaping ([Item]) -> ()) throws
        {
        guard let vDecoderHandler = decoderHandler else { throw "No decoder class provided" }
        let vURL = try Urls.getAPIUrl().get()
        URLSession.shared.dataTask(with: vURL) { (data, urlResponse, error) in
                if let data = data
                    {
            
                    let vDecodedData = vDecoderHandler.decodeToObject([Item].self, inToDecode: data)
                    
                    print("vDecodedData: \(vDecodedData)")

                    do
                        {
                        print("vDecodedData: \(try vDecodedData.get())")
                        try completion(vDecodedData.get())
                        }
                    catch
                        {
                        print("ERROR: \(error.localizedDescription)")
                        }
                    }
                
            }.resume()
        }
    } // end of class --------------------------------------------------------------

//==============================================================================

