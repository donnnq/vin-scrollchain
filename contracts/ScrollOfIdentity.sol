// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollOfIdentity {
    mapping(address => string) public titles;

    function declare(string calldata title) external {
        titles[msg.sender] = title;
    }

    function whoAmI(address addr) external view returns (string memory) {
        return titles[addr];
    }
}
