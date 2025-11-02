// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHarvestEquityTreaty {
    address public steward;

    struct HarvestClause {
        string barangay;
        string harvestType;
        string equityVerdict;
        string emotionalTag;
    }

    HarvestClause[] public treatyLog;

    event HarvestEquityTagged(string barangay, string harvestType, string equityVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHarvestEquity(
        string memory barangay,
        string memory harvestType,
        string memory equityVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(HarvestClause(barangay, harvestType, equityVerdict, emotionalTag));
        emit HarvestEquityTagged(barangay, harvestType, equityVerdict, emotionalTag);
    }
}
