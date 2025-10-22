// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostPowerCivicRebirthProtocol {
    address public admin;

    struct RebirthEntry {
        string individualName;
        string formerRole;
        string civicPath; // "Private life", "Public commentary", "Community work"
        string emotionalTag;
        bool reborn;
        bool sealed;
    }

    RebirthEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateRebirth(string memory individualName, string memory formerRole, string memory civicPath, string memory emotionalTag) external onlyAdmin {
        entries.push(RebirthEntry(individualName, formerRole, civicPath, emotionalTag, true, false));
    }

    function sealRebirthEntry(uint256 index) external onlyAdmin {
        require(entries[index].reborn, "Must be reborn first");
        entries[index].sealed = true;
    }

    function getRebirthEntry(uint256 index) external view returns (RebirthEntry memory) {
        return entries[index];
    }
}
