// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToBuyerEquityTreaty {
    address public steward;

    struct BuyerClause {
        string originBarangay;
        string buyerLocation;
        string deliveryVerdict;
        string emotionalTag;
    }

    BuyerClause[] public treatyLog;

    event BuyerEquityTagged(string originBarangay, string buyerLocation, string deliveryVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagBuyerEquity(
        string memory originBarangay,
        string memory buyerLocation,
        string memory deliveryVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(BuyerClause(originBarangay, buyerLocation, deliveryVerdict, emotionalTag));
        emit BuyerEquityTagged(originBarangay, buyerLocation, deliveryVerdict, emotionalTag);
    }
}
