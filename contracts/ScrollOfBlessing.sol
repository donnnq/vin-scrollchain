// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollOfBlessing {
    address public scrollholder;
    mapping(address => bool) public blessed;

    constructor() {
        scrollholder = msg.sender;
    }

    function bless(address addr) external {
        require(msg.sender == scrollholder, "Only scrollholder may bless.");
        blessed[addr] = true;
    }

    function isBlessed(address addr) external view returns (bool) {
        return blessed[addr];
    }
}
