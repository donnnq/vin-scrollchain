// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostBeneficiaryDetectionDAO {
    address public steward;

    struct BeneficiaryEntry {
        string nameHash;
        string barangay;
        string aidType;
        string timestamp;
        bool isFlagged;
        string reason;
    }

    BeneficiaryEntry[] public registry;

    event BeneficiaryFlagged(string nameHash, string barangay, string aidType, string timestamp, string reason);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function flagGhostBeneficiary(
        string memory nameHash,
        string memory barangay,
        string memory aidType,
        string memory timestamp,
        string memory reason
    ) public onlySteward {
        registry.push(BeneficiaryEntry(nameHash, barangay, aidType, timestamp, true, reason));
        emit BeneficiaryFlagged(nameHash, barangay, aidType, timestamp, reason);
    }
}
