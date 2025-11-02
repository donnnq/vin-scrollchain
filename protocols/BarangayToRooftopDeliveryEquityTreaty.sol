// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToRooftopDeliveryEquityTreaty {
    address public steward;

    struct DeliveryClause {
        string originBarangay;
        string destinationRooftop;
        string deliveryType;
        string emotionalTag;
    }

    DeliveryClause[] public treatyLog;

    event DeliveryEquityTagged(string originBarangay, string destinationRooftop, string deliveryType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDeliveryEquity(
        string memory originBarangay,
        string memory destinationRooftop,
        string memory deliveryType,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DeliveryClause(originBarangay, destinationRooftop, deliveryType, emotionalTag));
        emit DeliveryEquityTagged(originBarangay, destinationRooftop, deliveryType, emotionalTag);
    }
}
