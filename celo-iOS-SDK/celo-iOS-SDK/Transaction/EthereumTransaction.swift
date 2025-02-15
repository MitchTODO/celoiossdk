//
//  EthereumTransaction.swift
//   
//
//

import BigInt
import HandyJSON
import web3swift

struct EthereumTransactionModel: HandyJSON {
    var nonce: String?
    var gasPrice: String?
    var gasLimit: String?
    var to: String?
    var value: String?
    var data: String?
    var v: String?
    var r: String?
    var s: String?
    var chainID: String?
    var inferedChainID: String?
    var from: String?
    var hash: String?

    init() {
        return
    }
}

extension EthereumTransaction {
    
    func toJsonString() -> String {
        var model = EthereumTransactionModel()
        model.nonce = String(nonce)
        model.gasPrice = String(gasPrice)
        model.gasLimit = String(describing: gasLimit)
        model.to = to.address
        
        // Is conditin
        //let v = value
        //if v != nil {
        model.value = value.description
        //}
        
        model.data = data.toHexString().addHexPrefix().lowercased()
        model.v = String(v)
        model.r = String(r)
        model.s = String(s)
        model.chainID = String(describing: 44787) // intrinsic Chain id ???
        model.inferedChainID = String(describing: 44787) // infered chain id ???
        model.from = String(describing: sender!.address)
        model.hash = String(describing: hash!.toHexString().addHexPrefix())
        return model.toJSONString(prettyPrint: true)!
    }
    
}
