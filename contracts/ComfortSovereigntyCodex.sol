// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComfortSovereigntyCodex {
    address public admin;

    struct ComfortEntry {
        string shelterName;
        string purokName;
        string comfortStandard;
        string emotionalTag;
        bool deployed;
        bool sovereign;
    }

    ComfortEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployComfort(string memory shelterName, string memory purokName, string memory comfortStandard, string memory emotionalTag) external onlyAdmin {
        entries.push(ComfortEntry(shelterName, purokName, comfortStandard, emotionalTag, true, false));
    }

    function markSovereign(uint256 index) external onlyAdmin {
        entries[index].sovereign = true;
    }

    function getComfort(uint256 index) external view returns (ComfortEntry memory) {
        return entries[index];
    }
}
