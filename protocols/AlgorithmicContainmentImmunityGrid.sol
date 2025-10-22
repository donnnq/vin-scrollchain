// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AlgorithmicContainmentImmunityGrid {
    address public admin;

    struct ContainmentEntry {
        string platform; // "YouTube", "TikTok", "Facebook"
        string suppressionMethod; // "Shadowban", "Comment Filtering", "Feed Downgrade"
        string emotionalTag;
        bool immune;
        bool sealed;
    }

    ContainmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function declareImmunity(string memory platform, string memory suppressionMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ContainmentEntry(platform, suppressionMethod, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
