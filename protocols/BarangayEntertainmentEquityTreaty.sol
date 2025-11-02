// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayEntertainmentEquityTreaty {
    address public steward;

    struct EntertainmentClause {
        string barangay;
        string entertainmentType;
        string equityStatus;
        string emotionalTag;
    }

    EntertainmentClause[] public treatyLog;

    event EntertainmentEquityTagged(string barangay, string entertainmentType, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEntertainmentEquity(
        string memory barangay,
        string memory entertainmentType,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(EntertainmentClause(barangay, entertainmentType, equityStatus, emotionalTag));
        emit EntertainmentEquityTagged(barangay, entertainmentType, equityStatus, emotionalTag);
    }
}
