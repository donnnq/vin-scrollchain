// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorImmunityBreachCodex {
    address public admin;

    struct BreachEntry {
        string contractorName;
        string immunityClaim;
        string emotionalTag;
        bool flagged;
        bool denied;
    }

    BreachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagImmunityClaim(string memory contractorName, string memory immunityClaim, string memory emotionalTag) external onlyAdmin {
        entries.push(BreachEntry(contractorName, immunityClaim, emotionalTag, true, false));
    }

    function denyImmunity(uint256 index) external onlyAdmin {
        entries[index].denied = true;
    }

    function getBreachEntry(uint256 index) external view returns (BreachEntry memory) {
        return entries[index];
    }
}
