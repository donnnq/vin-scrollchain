// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract COCToCandidacyValidationProtocol {
    address public steward;

    struct ValidationEntry {
        string candidate; // "Sen. Joel Villanueva"
        string clause; // "Scrollchain-sealed protocol for COC validation and electoral consequence"
        string emotionalTag;
        bool filed;
        bool validated;
    }

    ValidationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function validateCOC(string memory candidate, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ValidationEntry(candidate, clause, emotionalTag, true, true));
    }

    function getValidationEntry(uint256 index) external view returns (ValidationEntry memory) {
        return entries[index];
    }
}
