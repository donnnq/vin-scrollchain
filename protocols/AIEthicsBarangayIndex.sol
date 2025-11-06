// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIEthicsBarangayIndex {
    address public steward;

    struct EthicsEntry {
        string barangay;
        string ethicsScore;
        string AIUsageContext;
        string emotionalTag;
    }

    EthicsEntry[] public index;

    event AIEthicsTagged(string barangay, string ethicsScore, string AIUsageContext, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory barangay,
        string memory ethicsScore,
        string memory AIUsageContext,
        string memory emotionalTag
    ) public onlySteward {
        index.push(EthicsEntry(barangay, ethicsScore, AIUsageContext, emotionalTag));
        emit AIEthicsTagged(barangay, ethicsScore, AIUsageContext, emotionalTag);
    }
}
