// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHBudgetOversightCodex {
    address public admin;

    struct OversightEntry {
        string projectName;
        string region;
        string emotionalTag;
        bool summoned;
        bool verified;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory projectName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(projectName, region, emotionalTag, true, false));
    }

    function verifyOversight(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getOversight(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
