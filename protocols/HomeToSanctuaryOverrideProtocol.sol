// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HomeToSanctuaryOverrideProtocol {
    address public steward;

    struct OverrideEntry {
        string assetType; // "Primary residence"
        string overrideClause; // "Property tax exemption, dignity override, scrollchain sanctuary"
        string emotionalTag;
        bool overridden;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function overrideSanctuary(string memory assetType, string memory overrideClause, string memory emotionalTag) external onlySteward {
        entries.push(OverrideEntry(assetType, overrideClause, emotionalTag, true, false));
    }

    function sealOverrideEntry(uint256 index) external onlySteward {
        require(entries[index].overridden, "Must be overridden first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
