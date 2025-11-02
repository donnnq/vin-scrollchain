// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectricityReliefCodex {
    address public steward;

    struct ReliefClause {
        string district;
        string reliefType;
        string energyPartner;
        string emotionalTag;
    }

    ReliefClause[] public codex;

    event ElectricityReliefLogged(string district, string reliefType, string energyPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRelief(
        string memory district,
        string memory reliefType,
        string memory energyPartner,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ReliefClause(district, reliefType, energyPartner, emotionalTag));
        emit ElectricityReliefLogged(district, reliefType, energyPartner, emotionalTag);
    }
}
