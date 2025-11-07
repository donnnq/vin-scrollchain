// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DefenseClauseTradeTreaty {
    address public steward;

    struct TreatyEntry {
        string alliedCountry;
        string defenseAgreement;
        string tradeBenefit;
        string emotionalTag;
    }

    TreatyEntry[] public treaty;

    event DefenseClauseTagged(string alliedCountry, string defenseAgreement, string tradeBenefit, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDefenseClause(
        string memory alliedCountry,
        string memory defenseAgreement,
        string memory tradeBenefit,
        string memory emotionalTag
    ) public onlySteard {
        treaty.push(TreatyEntry(alliedCountry, defenseAgreement, tradeBenefit, emotionalTag));
        emit DefenseClauseTagged(alliedCountry, defenseAgreement, tradeBenefit, emotionalTag);
    }
}
