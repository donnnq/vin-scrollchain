// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FranchiseToEmbassyLiaisonGrid {
    address public steward;

    struct LiaisonEntry {
        string hostCountry; // "Germany"
        string embassyContact; // "PH Embassy Berlin"
        string franchiseIntent; // "Jollibee deployment"
        string emotionalTag;
        bool initiated;
        bool sealed;
    }

    LiaisonEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function initiateLiaison(string memory hostCountry, string memory embassyContact, string memory franchiseIntent, string memory emotionalTag) external onlySteward {
        entries.push(LiaisonEntry(hostCountry, embassyContact, franchiseIntent, emotionalTag, true, false));
    }

    function sealLiaisonEntry(uint256 index) external onlySteward {
        require(entries[index].initiated, "Must be initiated first");
        entries[index].sealed = true;
    }

    function getLiaisonEntry(uint256 index) external view returns (LiaisonEntry memory) {
        return entries[index];
    }
}
