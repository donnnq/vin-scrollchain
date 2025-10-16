// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobileDevIncubatorDAO {
    address public admin;

    struct IncubationEntry {
        string devName;
        string purokLabel;
        string projectTitle;
        string emotionalTag;
        bool accepted;
        bool graduated;
    }

    IncubationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function acceptDev(string memory devName, string memory purokLabel, string memory projectTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(IncubationEntry(devName, purokLabel, projectTitle, emotionalTag, true, false));
    }

    function graduateDev(uint256 index) external onlyAdmin {
        entries[index].graduated = true;
    }

    function getIncubation(uint256 index) external view returns (IncubationEntry memory) {
        return entries[index];
    }
}
