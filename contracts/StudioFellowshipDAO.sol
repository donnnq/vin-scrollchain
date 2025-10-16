// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudioFellowshipDAO {
    address public admin;

    struct FellowshipEntry {
        string studioName;
        string purokLabel;
        string emotionalTag;
        bool accepted;
        bool graduated;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function acceptFellow(string memory studioName, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(studioName, purokLabel, emotionalTag, true, false));
    }

    function graduateFellow(uint256 index) external onlyAdmin {
        entries[index].graduated = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
