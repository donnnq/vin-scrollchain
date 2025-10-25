// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaToSanctuaryExpansionProtocol {
    address public steward;

    struct ExpansionEntry {
        string contactRegion; // "United States", "Canada", "Europe"
        string sanctuaryZone; // "Ghost city", "Vacant tower", "Unoccupied district"
        string expansionMethod; // "Fundrun", "Asset repurposing", "Diaspora stewardship"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    ExpansionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployExpansion(string memory contactRegion, string memory sanctuaryZone, string memory expansionMethod, string memory emotionalTag) external onlySteward {
        entries.push(ExpansionEntry(contactRegion, sanctuaryZone, expansionMethod, emotionalTag, true, false));
    }

    function sealExpansionEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getExpansionEntry(uint256 index) external view returns (ExpansionEntry memory) {
        return entries[index];
    }
}
