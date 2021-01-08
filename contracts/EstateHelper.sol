pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

import "./EstateFactory.sol";

contract EstateHelper is EstateFactory {

    function buyEstateById(uint estateId) external payable {
        require(msg.value == estates[estateId].price);
        //Effectuer la transaction d'achat
    }

    function getEstatesByOwner(address _owner) external view returns(uint[] memory){
    uint[] memory result = new uint[](ownerEstateCount[_owner]);
    uint counter = 0;
    for (uint i=0; i<estates.length; i++) {
        if (estateToOwner[i] == _owner) {
            result[counter] = i;
            counter++;
        }
    }
    return result;
    }

}
