// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayAILiteracyDAO {
    address public steward;

    struct LiteracyEntry {
        string barangay;
        string literacyFocus;
        string deploymentMechanism;
        string emotionalTag;
    }

    LiteracyEntry[] public registry;

    event AILiteracyTagged(string barangay, string literacyFocus, string deploymentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLiteracy(
        string memory barangay,
        string memory literacyFocus,
        string memory deploymentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LiteracyEntry(barangay, literacyFocus, deploymentMechanism, emotionalTag));
        emit AILiteracyTagged(barangay, literacyFocus, deploymentMechanism, emotionalTag);
    }
}
