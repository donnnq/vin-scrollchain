// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LastMileSovereigntyTreaty {
    address public steward;

    struct LastMileClause {
        string barangay;
        string deliveryType;
        string sovereigntyVerdict;
        string emotionalTag;
    }

    LastMileClause[] public treatyLog;

    event LastMileTagged(string barangay, string deliveryType, string sovereigntyVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLastMile(
        string memory barangay,
        string memory deliveryType,
        string memory sovereigntyVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(LastMileClause(barangay, deliveryType, sovereigntyVerdict, emotionalTag));
        emit LastMileTagged(barangay, deliveryType, sovereigntyVerdict, emotionalTag);
    }
}
