// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperFundingCodex {
    address public admin;

    struct FundingEntry {
        string devName;
        string gameTitle;
        uint256 totalBoost;
        string emotionalTag;
        bool funded;
    }

    FundingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logFunding(string memory devName, string memory gameTitle, uint256 totalBoost, string memory emotionalTag) external onlyAdmin {
        entries.push(FundingEntry(devName, gameTitle, totalBoost, emotionalTag, false));
    }

    function markFunded(uint256 index) external onlyAdmin {
        entries[index].funded = true;
    }

    function getFunding(uint256 index) external view returns (FundingEntry memory) {
        return entries[index];
    }
}
