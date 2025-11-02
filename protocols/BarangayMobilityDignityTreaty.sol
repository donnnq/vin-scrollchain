// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMobilityDignityTreaty {
    address public steward;

    struct MobilityClause {
        string barangay;
        string transportMode;
        string dignityVerdict;
        string emotionalTag;
    }

    MobilityClause[] public treatyLog;

    event MobilityTagged(string barangay, string transportMode, string dignityVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagMobility(
        string memory barangay,
        string memory transportMode,
        string memory dignityVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(MobilityClause(barangay, transportMode, dignityVerdict, emotionalTag));
        emit MobilityTagged(barangay, transportMode, dignityVerdict, emotionalTag);
    }
}
