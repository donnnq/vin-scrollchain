// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SSToGlobalRetirementTreaty {
    address public steward;

    struct TreatyEntry {
        string benefitType; // "Social Security"
        string treatyClause; // "Global dignity protection, tax exemption, scrollchain-sealed"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyTreaty(string memory benefitType, string memory treatyClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(benefitType, treatyClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
