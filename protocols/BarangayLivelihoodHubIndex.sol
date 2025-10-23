// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLivelihoodHubIndex {
    address public steward;

    struct HubEntry {
        string barangayName;
        string hubType; // "Sewing coop", "Digital work center", "Urban garden", "Food prep kitchen"
        string emotionalTag;
        bool operational;
        bool sealed;
    }

    HubEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateHub(string memory barangayName, string memory hubType, string memory emotionalTag) external onlySteward {
        entries.push(HubEntry(barangayName, hubType, emotionalTag, true, false));
    }

    function sealHubEntry(uint256 index) external onlySteward {
        require(entries[index].operational, "Must be operational first");
        entries[index].sealed = true;
    }

    function getHubEntry(uint256 index) external view returns (HubEntry memory) {
        return entries[index];
    }
}
