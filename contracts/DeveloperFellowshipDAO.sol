// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperFellowshipDAO {
    address public admin;

    struct FellowEntry {
        string devName;
        string purokLabel;
        string emotionalTag;
        bool accepted;
        bool graduated;
    }

    FellowEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function acceptFellow(string memory devName, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowEntry(devName, purokLabel, emotionalTag, true, false));
    }

    function graduateFellow(uint256 index) external onlyAdmin {
        entries[index].graduated = true;
    }

    function getFellow(uint256 index) external view returns (FellowEntry memory) {
        return entries[index];
    }
}
