// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaNourishmentLedger {
    address public steward;

    struct Nourishment {
        string dish;
        string diasporaRegion;
        string remittanceSource;
        string emotionalTag;
    }

    Nourishment[] public nourishmentLog;

    event NourishmentTagged(string dish, string diasporaRegion, string remittanceSource, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagNourishment(
        string memory dish,
        string memory diasporaRegion,
        string memory remittanceSource,
        string memory emotionalTag
    ) public onlySteward {
        nourishmentLog.push(Nourishment(dish, diasporaRegion, remittanceSource, emotionalTag));
        emit NourishmentTagged(dish, diasporaRegion, remittanceSource, emotionalTag);
    }
}
