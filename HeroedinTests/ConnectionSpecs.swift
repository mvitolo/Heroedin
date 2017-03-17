//
//  ConnectionSpecs.swift
//  Heroedin
//
//  Created by teo on 10/03/2017.
//  Copyright © 2017 teo. All rights reserved.
//

import Quick
import Nimble
import Mockingjay
import Alamofire
@testable import Heroedin

class ConnectionSpecs: QuickSpec {
    
    override func spec() {
        super.spec()
        
        beforeSuite {
        }
        
        successBlockCalledAfterSuccessfulHTTPRequest()
       
    }
}

// MARK: - GET calls execution
extension ConnectionSpecs {
   
    /**
     * GIVEN that I execute a .get request to a URL
     * EXECUTE request
     * EXPECT the success block to be called
     */
    func successBlockCalledAfterSuccessfulHTTPRequest() {
        
        context("") {
            
            beforeEach {
            }
            
            describe("Executing a correct get request to a URL") {
                it("should be successful") {
                    var isSuccessful: Bool = false

                     waitUntil(timeout: 10, action: { done in
                        MarvelHelper.sharedInstance.getCarachters(offset:  0, handler: { response in
                            print(response.result.value as Any)   // result of response serialization
                            isSuccessful = true
                            done()
                        })
                        
                     })
                    expect(isSuccessful).to( beTrue() )
                }
            }
            
        }
    }
}
