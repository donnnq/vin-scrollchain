// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransitAestheticImmunityCodex {
    address public steward;

    struct AestheticClause {
        string stationName;
        string structureType;
        string immunityProtocol;
        string emotionalTag;
    }

    AestheticClause[] public codex;

    event TransitAestheticTagged(string stationName, string structureType, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAesthetic(
        string memory stationName,
        string memory structureType,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AestheticClause(stationName, structureType, immunityProtocol, emotionalTag));
        emit TransitAestheticTagged(stationName, structureType, immunityProtocol, emotionalTag);
    }
}
