// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLightEquityTreaty {
    address public steward;

    struct LightClause {
        string barangay;
        string lightingType;
        string equityStatus;
        string emotionalTag;
    }

    LightClause[] public treatyLog;

    event LightEquityTagged(string barangay, string lightingType, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagLightEquity(
        string memory barangay,
        string memory lightingType,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(LightClause(barangay, lightingType, equityStatus, emotionalTag));
        emit LightEquityTagged(barangay, lightingType, equityStatus, emotionalTag);
    }
}
