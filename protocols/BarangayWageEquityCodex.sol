// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWageEquityCodex {
    address public steward;

    struct EquityClause {
        string barangay;
        string jobType;
        string wageStandard;
        string emotionalTag;
    }

    EquityClause[] public codex;

    event WageEquityTagged(string barangay, string jobType, string wageStandard, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory barangay,
        string memory jobType,
        string memory wageStandard,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EquityClause(barangay, jobType, wageStandard, emotionalTag));
        emit WageEquityTagged(barangay, jobType, wageStandard, emotionalTag);
    }
}
