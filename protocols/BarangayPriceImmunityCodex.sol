// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayPriceImmunityCodex {
    address public steward;

    struct PriceClause {
        string barangay;
        string essentialGood;
        string priceCeiling;
        string emotionalTag;
    }

    PriceClause[] public codex;

    event PriceImmunityTagged(string barangay, string essentialGood, string priceCeiling, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPriceImmunity(
        string memory barangay,
        string memory essentialGood,
        string memory priceCeiling,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(PriceClause(barangay, essentialGood, priceCeiling, emotionalTag));
        emit PriceImmunityTagged(barangay, essentialGood, priceCeiling, emotionalTag);
    }
}
