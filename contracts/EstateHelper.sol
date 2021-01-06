pragma solidity ^0.4.0;

import "./EstateFactory.sol";

contract EstateHelper is EstateFactory {

    function EstateHelper(){

    }

    function buyEstateById(uint estateId) external payable {
        require(msg.value == estates[estateId].price);
        zombies[_zombieId].level++;
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
