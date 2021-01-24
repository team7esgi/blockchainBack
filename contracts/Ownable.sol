pragma solidity 0.8.0;

contract Ownable {

    address private owner = msg.sender;

    modifier onlyOwner{
        require(msg.sender == owner);

        _;
    }

}
