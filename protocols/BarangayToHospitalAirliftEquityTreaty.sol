// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToHospitalAirliftEquityTreaty {
    address public steward;

    struct AirliftClause {
        string originBarangay;
        string hospitalName;
        string airliftType;
        string emotionalTag;
    }

    AirliftClause[] public treatyLog;

    event AirliftEquityTagged(string originBarangay, string hospitalName, string airliftType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAirliftEquity(
        string memory originBarangay,
        string memory hospitalName,
        string memory airliftType,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AirliftClause(originBarangay, hospitalName, airliftType, emotionalTag));
        emit AirliftEquityTagged(originBarangay, hospitalName, airliftType, emotionalTag);
    }
}
