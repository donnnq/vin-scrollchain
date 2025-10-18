// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialConsequenceProtocol {
    address public admin;

    struct ViolationEntry {
        string name;
        string violationType;
        string emotionalTag;
        bool summoned;
        bool investigated;
        bool sentenced;
    }

    ViolationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonViolation(string memory name, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(ViolationEntry(name, violationType, emotionalTag, true, false, false));
    }

    function investigateViolation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sentenceViolation(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sentenced = true;
    }

    function getViolationEntry(uint256 index) external view returns (ViolationEntry memory) {
        return entries[index];
    }
}
