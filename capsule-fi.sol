// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
contract capsule is Initializable, ERC1155Upgradeable, AccessControlUpgradeable, PausableUpgradeable, ERC1155BurnableUpgradeable, ERC1155SupplyUpgradeable, UUPSUpgradeable {
    bytes32 public constant URI_SETTER_ROLE = keccak256("URI_SETTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER_ROLE");
    
    struct T_B  { 
        address user;
        //coin balances
        uint al_b; 
        uint ac_b; 
        uint w_b;  
        uint m_b; 
    }
    

   struct money_Balance {
       address user;
       // money balances for Altoco and Aldolo
       uint mal_b;
       uint mac_b;

   }

    T_B[] public ar_U;
    
    money_Balance[] public array_M;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}
    function initialize() initializer public {
        __ERC1155_init("");
        __AccessControl_init();
        __Pausable_init();
        __ERC1155Burnable_init();
        __ERC1155Supply_init();
        __UUPSUpgradeable_init();
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(URI_SETTER_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(UPGRADER_ROLE, msg.sender);
        _mint(msg.sender, 2, 10000, 'word');
        _mint(msg.sender, 3, 10000, 'favor');
    }
    function setURI(string memory newuri) public onlyRole(URI_SETTER_ROLE) {
        _setURI(newuri);
    }
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }
    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }
    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyRole(MINTER_ROLE)
    {
        _mint(account, id, amount, data);
    }
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyRole(MINTER_ROLE)
    {
        _mintBatch(to, ids, amounts, data);
    }
    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        whenNotPaused
        override(ERC1155Upgradeable, ERC1155SupplyUpgradeable)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
    function _authorizeUpgrade(address newImplementation)
        internal
        onlyRole(UPGRADER_ROLE)
        override
    {}
    // The following functions are overrides required by Solidity.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC1155Upgradeable, AccessControlUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    //some modularized logic

    function Adoco_mint(address user, uint ac, uint am) public payable{
        require(ac != 0 && ac <= 3);


        //@dev: mint at index 0 ac amount of Adoco
        _mint(user, 0, ac, '');

        //"directly transfer money to the adocoo pool if wants to mint only 1 adoco, lower fees with this option
        if(ac == 1){

            (bool sent, bytes memory data) = user.call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        array_M.push(money_Balance(msg.value , msg.value));


        }
        //@dev: push values inside of tracking array
        ar_U.push(T_B(user, 1, ac, 2, 3));

        //@dev: push values inside of money array

        array_M.push(money_Balance(msg.value, msg.value));


    }

    function Adoco_load(uint casIn) public payable{
        //check if  minted
        // check ids of adoco minted

    }
    function Adoco_unload(cashOut) public {}
//selling adoco option part will not delete your adoco and the money will remain in the main pool, the action creates a new token
//on the buyers address and update the current owners address
    function Adoco_fraction_sell(address _to){
        array_M.push(money_Balance(mal_b, mac_v - msg.value));
        
    }
    
    function Adolo_mint(address user, uint al) external payable {
        _mint(msg.sender, 1, al, '');
        ar_U.push(T_B(user, al, '', '', ''));

    }

    function Adolo_load(uint cashIn) public payable{}

    function Adolo_unload(uint cashOut) public{}

    function Adolo_fraction_sell(){}


    function claimword24h(address user, uint be) public{
        _mint(msg.sender, 2, 10, '');
        ar_U.push(T_B(user, ,'', be, ''));
        
    }
    function claimfavor24(address user, uint me) public{
        _mint(msg.sender, 3, 10, '');
        ar_U.push(T_B(msg.sender, '', '', '', me));
    }
    function useWORD() public{}
    function useFAVOR() public{}

   
    

}
