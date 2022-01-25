// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

//stores the minted in house assets and is responsible for maintaining requests from external Swap contracts to transfer a selected asset


contract Treasury is IERC1155Receiver {


/*minting of all assets should not be allowed to happen from the user, instead the user is offered the full utility with a transfer of the tokens to her respective wallet address
 *Everything is preminted and distributed to match programmatically defined demand(example: Saddle user participates in LP, the protocol aknowledges that that user may ask for One token
 *needs to be whitelisted to claim)
*This architecture makes successful full scale attacks way less severe. In case of a breached Treasury the attacker will receive
the minimum possible funds from such attack, as circulation is added gradually and the mint function just requires to reach a total quota before is unable to mint more
(example: 50m tokens of Pylon & 5m Bak coin tokens)
*/

//One for Pylon can also be staked in this smart contract
//stablecoin, calculate its value to LP provided for x time

    //some timevalues

    constant min
  //  event receive One
  //  event receive Ambrosia
  //  event receive Nectar
  //  event receive Pylon
  //  event receive Bak

//if is saddle pool user or old user, 2 if liquidity is locked
    //event sent One
//if its coinfolio  owner
    //event sent Ambrosia
//if its stablefolio owner
    //event sent Nectar
//release gradually 
    //event sent Pylon
//if meritocratic conditions are met
    //event Sent Bak

//to get Pylon
    //event stake One
//to get nectar
    //event stake Pylon 

    //event sent rewards

//Depends on provided liquidity
//else check coinfiolio value
    function sentOne(address account, uint ammount){
        
    }

    function sentAmbrosia(address account, uint ammount){

    }

    function sentNectar(address account, uint ammount){

    }

    function sentPylon(address account, uint ammount){

    }

    function SentBak(address account, uint ammount){

    }


    function stakeOne(address one,address pylonReceiver)

    function stakePylon(address Pylon, uint ammount)
