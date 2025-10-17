// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string purokName;
        string foodProgram;
        string emotionalTag;
        bool deployed;
        bool sovereign;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployProgram(string memory purokName, string memory foodProgram, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(purokName, foodProgram, emotionalTag, true, false));
    }

    function markSovereign(uint256 index) external onlyAdmin {
        entries[index].sovereign = true;
    }

    function getProgram(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
