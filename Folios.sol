//721 receiver
//add minter contract
//factory utility
//interface general architecture


constant minPeriod = 3 seconds;
constant maxPeriod = 200 days;


event claim folio;

event claimRewards;

event programmed transaction;

struct state{
    //stores non stable tokens
    bool coinfolio = false;
    //can make scheduled transfers
    bool cashflowUtils = false;
    //is above a specific value to receive Ambrosia
    bool AmCriteria = false;
    //is above a specific value to receive Nectar
    bool forSale = false;
    //is locked for x timeframe
    bool locked = false;

}
//A balance sheet that holds relevant information, used to distribute Ambrosia and Nectar to holders
//The transaction isnt performed until the user requests.
//initialised after user requests the rewards tokens 
struct Balances{
    //total days the holder has folio toped up with a specific ammount
    uint weeksHold;
    //ammount of Ambrosia that can be asked from Token Treasury
    uint AmToClaim;
    //ammount already claimed
    uint AmClaimed;
    //amount of Nectar to be claimed
    uint NeToClaim;
    //ammount of Nectar already claimed
    uint NeClaimed;

    

}

mapping(address => state) ;
//where the user claims his/her nft wallet
    function claimFolio(){

    }
//parameters for instant transaction

    function transact()
    //trigger unload or an other function

    function setBuy{

    }

    function buy external{
    
    }
    
    


    function enableCashflow(uint numberOf,uint task){
        require(numberOf > 0);
        require(task >= minPeriod && task <= maxperiod);
        cashFlowUtils = true;
        if (numberOf > 1)
    }

  


    function setLoadable(bool _loadable) public{
       require(hasRole(PAUSER_ROLE, _msgSender()), "This address is not the NFT owner");
       loadable = _loadable;
    }
    
    
//@dev bind value to the nft
    function load() public payable{
    //require to be one coin or usdc or usdt
       require(loadable != false);
 } 
//@dev remove the value from the nft to the specified in the dapp frontend Beneficary address
    function unload(address payable Beneficary,uint256 cashOutAmount, uint256 tokenId) public {
       require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721Burnable: caller is not owner nor approved");
       require(loadable != false);
       require(hasRole(PAUSER_ROLE, _msgSender()), "This address is not the NFT owner");
       Beneficary.transfer(cashOutAmount);
    
    
    
}
