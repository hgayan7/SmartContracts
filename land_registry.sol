pragma solidity ^0.4.24;

contract LandRegistry{
    
    address owner;
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyGovt{
        require(msg.sender == owner);
        _;
    }
    
    struct LandDetails{
        
        string landOwner;
        string landExOwner;
        string district;
        string taluk;
        string vilage;
        uint pattanumber;
        uint id;
        
    }
    
    struct Owner{
        
        uint aadharNumber;
        string ownerAddress;
        string sonOf;
        string town;
        uint id;
        
    }
    
    mapping(uint => LandDetails) landDetails;
    mapping(uint => Owner) ownerDetails;
    uint value;
    
    function registerLandData(
        string _landOwner,
        string _landExOwner,
        string _district,
        string _taluk,
        string _vilage,
        uint _pattanumber,
        uint _id
        ) onlyGovt public{
        
        landDetails[value] = LandDetails(_landOwner,_landExOwner,_district,
        _taluk,_vilage,_pattanumber,_id);
        
    }
    
    function registerOwnerData(uint _aadharNumber,
        string _ownerAddress,
        string _sonOf,
        string _town,uint _id) onlyGovt public{
            ownerDetails[value] = Owner(_aadharNumber,_ownerAddress,_sonOf,_town,_id);
            value++;
        }
        
    function getLandData(uint _id) view public returns(string _landOwner,
        string,string,string,string,uint){
            
            for (uint i = 0; i < value; i++) {
                if(_id == landDetails[i].id){
                    return (landDetails[i].landOwner,landDetails[i].landExOwner,
                    landDetails[i].district,landDetails[i].taluk,landDetails[i].vilage,
                    landDetails[i].pattanumber);
                }
             }
        }
        
    function getOwnerData(uint _id) view public returns( uint,string,string,string){
        
        for (uint i = 0; i < value; i++) {
                if(_id == ownerDetails[i].id){
                    return (ownerDetails[i].aadharNumber,ownerDetails[i].ownerAddress,
                    ownerDetails[i].sonOf,ownerDetails[i].town);
                }
             }
        
    }
    
    function getTotalDataCount() view public returns(uint){
        return value;
    }
    
}
