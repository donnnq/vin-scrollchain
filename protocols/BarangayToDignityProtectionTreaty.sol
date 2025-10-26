// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToDignityProtectionTreaty {
    address public steward;

    struct TreatyEntry {
        string zoneType; // "Barangay interior"
        string protectionClause; // "Exempt from highway enforcement, scrollchain-sealed dignity zone"
        string emotionalTag; // "Community sovereignty, no harassment"
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

    function ratifyTreaty(string memory zoneType, string memory protectionClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(zoneType, protectionClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
