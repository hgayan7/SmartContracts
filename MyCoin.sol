pragma solidity ^0.4.19;

contract MyCoin{
    
    address owner;
    mapping(address=>uint) balance;
    
    modifier minimumBalance(uint value,address receiver){
        require(balance[msg.sender]>=value);
        _;
    }
    function MyCoin() public{
        owner=msg.sender;
        balance[owner]=10000;
    }
    
    function sendCoins(uint value,address receiver) minimumBalance(value,receiver){
        
            balance[receiver]+=value;
            balance[msg.sender]-=value;
       
    }

    function getOwnBalance()constant returns (uint){
    
        return balance[msg.sender];
    }
}