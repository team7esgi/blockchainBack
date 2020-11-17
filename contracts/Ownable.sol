pragma solidity ^0.4.0;

contract Ownable {
    function Ownable(){

    }

    address private owner = msg.sender;

    modifier onlyOwner{
        require(msg.sender == owner);

        _;
    }

}
