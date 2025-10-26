// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnforcementToJurisdictionOverrideProtocol {
    address public steward;

    struct EnforcementEntry {
        string locationType; // "Barangay interior roads"
        string enforcementScope; // "Helmet checks only on highways"
        string overrideClause; // "No enforcement in low-traffic zones"
        string emotionalTag; // "Dignity override, barangay sovereignty"
        bool activated;
        bool sealed;
    }

    EnforcementEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateOverride(string memory locationType, string memory enforcementScope, string memory overrideClause, string memory emotionalTag) external onlySteward {
        entries.push(EnforcementEntry(locationType, enforcementScope, overrideClause, emotionalTag, true, false));
    }

    function sealOverrideEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (EnforcementEntry memory) {
        return entries[index];
    }
}
