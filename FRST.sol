// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "./myERC.sol";

contract FRST is myERC {

    address owner;
    constructor(string memory name_, string memory symbol_, uint256 initialSupply) myERC(name_, symbol_) {
        owner = msg.sender;
        Mint(initialSupply);
    }

    modifier isOwner(){
        require(msg.sender == owner, "You are not an owner");
        _;
    }

    function Mint(uint _toMint) public isOwner(){
        _totalSupply += _toMint;
        _balances[owner] += _toMint;
    } 
}
