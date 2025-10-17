// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComfortRitualCodex {
    address public admin;

    struct ComfortEntry {
        string shelterName;
        string purokName;
        string comfortMetric;
        string emotionalTag;
        bool deployed;
        bool ritualized;
    }

    ComfortEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployComfort(string memory shelterName, string memory purokName, string memory comfortMetric, string memory emotionalTag) external onlyAdmin {
        entries.push(ComfortEntry(shelterName, purokName, comfortMetric, emotionalTag, true, false));
    }

    function ritualizeComfort(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getComfort(uint256 index) external view returns (ComfortEntry memory) {
        return entries[index];
    }
}
