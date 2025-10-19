// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParentLedTherapyAccessCodex {
    address public admin;

    struct AccessEntry {
        string childName;
        string region;
        string therapyType;
        string emotionalTag;
        bool summoned;
        bool accessed;
        bool sealed;
    }

    AccessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAccess(string memory childName, string memory region, string memory therapyType, string memory emotionalTag) external onlyAdmin {
        entries.push(AccessEntry(childName, region, therapyType, emotionalTag, true, false, false));
    }

    function confirmAccess(uint256 index) external onlyAdmin {
        entries[index].accessed = true;
    }

    function sealAccessEntry(uint256 index) external onlyAdmin {
        require(entries[index].accessed, "Must be accessed first");
        entries[index].sealed = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
