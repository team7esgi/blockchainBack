pragma solidity >=0.4.22 <0.8.0;

contract Escrow{

    address agent;

    mapping (address => uint256) public deposits;

    modifier onlyAgent(){
        require(msg.sender == agent);
        _;
    }

    constructor(){
        agent = msg.sender;
    }

    function deposit(address seller) public payable {
        uint256 amount = msg.value;
        deposits[seller] = deposits[seller] + amount;
    }

    function withdraw(address payable seller) public onlyAgent {
        uint256 payment = deposits[seller];
        deposits[seller] = 0;
        seller.transfer(payment);
    }

}