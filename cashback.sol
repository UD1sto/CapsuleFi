//SPDX

pragma solidity 0.8.2;
//event receive funds
//event initialize cashback
//event blacklist user

//*sent eth manually to distributor

//*give cashback to whitelisted requests

//

address payable distributor;
address manager public;

struct user{
    address cashBackA[];
    string iPfs[];
    uint nonce;
    bool authorized[];

}



//submit your dishtag photo and an additional one next to the bill that image is hashed and uploaded to ipfs
   function submitTag(string resNam, address rec, string ipfs){
       user.iPfs = ipfs;
       user.nonce ++;
       user.cashBackA = rec;
       


}

}
   function Authorize(uint decide){
      
  }


   function claimStatus(){
       require(address !=0);


  }

  

