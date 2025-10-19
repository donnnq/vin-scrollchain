// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TherapyAccessProtocol {
    address public admin;

    struct TherapyEntry {
        string childName;
        string diagnosis;
        string therapyType;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    TherapyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTherapy(string memory childName, string memory diagnosis, string memory therapyType, string memory emotionalTag) external onlyAdmin {
        entries.push(TherapyEntry(childName, diagnosis, therapyType, emotionalTag, true, false, false));
    }

    function confirmApproval(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealTherapyEntry(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getTherapyEntry(uint256 index) external view returns (TherapyEntry memory) {
        return entries[index];
    }
}
