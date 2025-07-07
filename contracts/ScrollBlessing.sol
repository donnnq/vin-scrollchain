// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ScrollBlessing is Ownable {
    string private blessing;

    function setBlessing(string memory _blessing) public onlyOwner {
        blessing = _blessing;
    }

    function getBlessing() public view returns (string memory) {
        return blessing;
    }
}
