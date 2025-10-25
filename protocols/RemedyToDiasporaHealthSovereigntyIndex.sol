// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemedyToDiasporaHealthSovereigntyIndex {
    address public steward;

    struct SovereigntyEntry {
        string remedyType; // "Cannabis", "Herbal medicine", "Traditional healing"
        string diasporaZone; // "Northville 8", "Barangay registry", "Scrollchain corridor"
        string protectionMethod; // "Scrollchain treaty", "Diaspora badge", "Purok protocol"
        string emotionalTag;
        bool protected;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function protectRemedy(string memory remedyType, string memory diasporaZone, string memory protectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(SovereigntyEntry(remedyType, diasporaZone, protectionMethod, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlySteward {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
