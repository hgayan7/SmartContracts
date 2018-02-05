pragma solidity ^0.4.19;

contract MyCoin{
    
    address owner;
    mapping(address=>uint) balance;
    
    function MyCoin() public{
        owner=msg.sender;
        balance[owner]=10000;
    }
    
    function sendCoins(uint value,address receiver) public{
        if(msg.sender==owner){
            balance[receiver]+=value;
            
        }
        else if(balance[msg.sender]>value){
            balance[receiver]+=value;
            balance[msg.sender]-=value;
        }
        else{
            throw;
        }
        
        
    }
    function getOwnBalance()constant returns (uint){
        return balance[msg.sender];
    }
}