//
//  NetworkService.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Class responsible to request data from server
 */
class APIProviderOLD
    {
    
    // MARK: - Class variables

	/// Instance of the DecoderHandler
    private let decoderHandler : DecoderHandler?

    // MARK: - Constructor

	/**
	 Main constructor
	 */
    init()
        {
        decoderHandler          = DecoderHandler()
        }
    
    // MARK: - Public methods

    /**
     Call API to fetch list of Item
     */
    public func fetchListOfItems(completion : @escaping (Result<ItemsWithCategory, Error>) -> ())
        {
        // -----------------
        // Ensure that an instance of DecoderHandler exists, else prevent host
        // -----------------
        guard let vDecoderHandler = decoderHandler else
			{
			completion(.failure(APIError.internalError))
			return
			}
        // -----------------
        // Then request the API to obtain the list of available items
        // -----------------
        requestAPI(inWS: Urls.WSPath.LISTINGS, completion:
            { inData in
            do
                {
				let vDecodedData = vDecoderHandler.decodeToObject([Item].self, inToDecode: try inData.get())
                let outItems = ItemsWithCategory(inListOfItem: try vDecodedData.get())
                completion(.success(outItems))
                }
            catch
                {
				ZenLog.x("ERROR: \(error.localizedDescription)")
                completion(.failure(error))
                }
            })
        }
    
    /**
     Call API to fetch list of Category
     */
    public func fetchListOfCategory(completion : @escaping (Result<[Category], Error>) -> ())
        {
        // -----------------
        // Ensure that an instance of DecoderHandler exists, else prevent host
        // -----------------
        guard let vDecoderHandler = decoderHandler else
			{
			completion(.failure(APIError.internalError))
			return
			}
        // -----------------
        // Then request the API to obtain the list of available category
        // -----------------
        requestAPI(inWS: Urls.WSPath.CATEGORY, completion:
            { inData in
            do
                {
				let vDecodedData = vDecoderHandler.decodeToObject([Category].self, inToDecode: try inData.get())
                try completion(.success(vDecodedData.get()))
                }
            catch
                {
                ZenLog.x("ERROR: \(error.localizedDescription)")
                completion(.failure(error))
                }
            })
        }
    
    
    // MARK: - Toolbox methods

   
    
    } // end of class --------------------------------------------------------------

//==============================================================================
