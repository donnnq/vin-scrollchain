// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobilePortingAcceleratorPack {
    address public admin;

    struct PortingEntry {
        string devName;
        string gameTitle;
        string emotionalTag;
        bool submitted;
        bool accelerated;
    }

    PortingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPorting(string memory devName, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(PortingEntry(devName, gameTitle, emotionalTag, true, false));
    }

    function acceleratePorting(uint256 index) external onlyAdmin {
        entries[index].accelerated = true;
    }

    function getPorting(uint256 index) external view returns (PortingEntry memory) {
        return entries[index];
    }
}
