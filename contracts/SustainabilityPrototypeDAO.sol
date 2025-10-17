// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SustainabilityPrototypeDAO {
    address public admin;

    struct PrototypeEntry {
        string solutionName;
        string teamName;
        string emotionalTag;
        bool submitted;
        bool validated;
    }

    PrototypeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPrototype(string memory solutionName, string memory teamName, string memory emotionalTag) external onlyAdmin {
        entries.push(PrototypeEntry(solutionName, teamName, emotionalTag, true, false));
    }

    function validatePrototype(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getPrototype(uint256 index) external view returns (PrototypeEntry memory) {
        return entries[index];
    }
}
