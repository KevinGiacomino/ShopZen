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
    
    /**
     Call API to fetch list of Item
     */
    public func fetchListOfItems(completion : @escaping ([Item]) -> ()) throws
        {
        // -----------------
        // Ensure that an instance of DecoderHandler exists, else prevent host
        // -----------------
        guard let vDecoderHandler = decoderHandler else { throw "No decoder class provided" }
        // -----------------
        // Then request the API to obtain the list of available items
        // -----------------
        try requestAPI(inWS: Urls.WS.LISTINGS, completion:
            { inData in
            let vDecodedData = vDecoderHandler.decodeToObject([Item].self, inToDecode: inData)
            do
                {
                print("vDecodedData: \(try vDecodedData.get())")
                try completion(vDecodedData.get())
                }
            catch
                {
                print("ERROR: \(error.localizedDescription)")
                }
            })
        }
    
    /**
     Call API to fetch list of Category
     */
    public func fetchListOfCategory(completion : @escaping ([Category]) -> ()) throws
        {
        // -----------------
        // Ensure that an instance of DecoderHandler exists, else prevent host
        // -----------------
        guard let vDecoderHandler = decoderHandler else { throw "No decoder class provided" }
        // -----------------
        // Then request the API to obtain the list of available category
        // -----------------
        try requestAPI(inWS: Urls.WS.CATEGORY, completion:
            { inData in
            let vDecodedData = vDecoderHandler.decodeToObject([Category].self, inToDecode: inData)
            do
                {
                print("vDecodedData: \(try vDecodedData.get())")
                try completion(vDecodedData.get())
                }
            catch
                {
                print("ERROR: \(error.localizedDescription)")
                }
            })
        }
    
    
    
    private func requestAPI
        (
        inWS        : Urls.WS,
        completion  : @escaping (Data) -> ()
        ) throws
        {
        let vURL = try Urls.getAPIUrl( inWS: inWS ).get()
        URLSession.shared.dataTask(with: vURL) { (data, urlResponse, error) in
            if let vData = data
                {
                completion(vData)
                }
            else
                {
                // TODO: RETURN ERROR
                //completion(.)
                }
                
            }.resume()
        }
    
    } // end of class --------------------------------------------------------------

//==============================================================================

