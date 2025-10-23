// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateOverrideImmunityProtocol {
    address public steward;

    struct ImmunityEntry {
        string ombudsmanOrder;
        string legislativeBody; // "Senate", "Congress"
        string overrideType; // "Delay", "Non-compliance", "Political shielding"
        string emotionalTag;
        bool flagged;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagOverride(string memory ombudsmanOrder, string memory legislativeBody, string memory overrideType, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(ombudsmanOrder, legislativeBody, overrideType, emotionalTag, true, false));
    }

    function sealOverrideEntry(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
