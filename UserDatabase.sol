pragma solidity ^0.4.19;

contract Database{
    
    address DBowner;
    
    struct User{
        
        uint age;
        string name;
        string gender;
    
    }
    
    mapping(address=>User) users;
    address[] accounts;
    
    function Database(){
        
        DBowner=msg.sender;
    }
    
    function addUser(address userAddress,uint Age,string Name,string Gender){
        
        var user=users[userAddress];
        user.age=Age;
        user.name=Name;
        user.gender=Gender;
        accounts.push(userAddress) -1;
        
    }

    function getUser(address userAddress)view public returns(uint,string,string){

        require(msg.sender==userAddress||msg.sender==DBowner);
        return (users[userAddress].age,users[userAddress].name,users[userAddress].gender);
        
    }

    function getAllUsers()view public returns (address[]){
    
        require(msg.sender==DBowner);
        return accounts;
    }
    
}