// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SabungeroDisappearanceLedger {
    address public admin;

    struct DisappearanceEntry {
        string name;
        string lastSeenLocation;
        string purokZone;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    DisappearanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDisappearance(string memory name, string memory lastSeenLocation, string memory purokZone, string memory emotionalTag) external onlyAdmin {
        entries.push(DisappearanceEntry(name, lastSeenLocation, purokZone, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealDisappearanceEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getDisappearanceEntry(uint256 index) external view returns (DisappearanceEntry memory) {
        return entries[index];
    }
}
