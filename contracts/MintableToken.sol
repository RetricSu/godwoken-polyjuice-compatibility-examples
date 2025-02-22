// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MintableToken is ERC20, Ownable {
    address public minter;

    constructor() ERC20("MintableToken", "MT") {}

    function setMinter(address _minter) public onlyOwner {
        minter = _minter;
    }

    function mint(address account, uint256 amount) public {
        require(msg.sender == minter, "minter role is required");

        _mint(account, amount);
    }
}
