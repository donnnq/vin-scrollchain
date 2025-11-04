// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeSchoolResilienceDAO {
    address public steward;

    struct ResilienceEntry {
        string tradeSkill;
        string enrollmentSignal;
        string resiliencePath;
        string emotionalTag;
    }

    ResilienceEntry[] public registry;

    event TradeSchoolResilienceTagged(string tradeSkill, string enrollmentSignal, string resiliencePath, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory tradeSkill,
        string memory enrollmentSignal,
        string memory resiliencePath,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResilienceEntry(tradeSkill, enrollmentSignal, resiliencePath, emotionalTag));
        emit TradeSchoolResilienceTagged(tradeSkill, enrollmentSignal, resiliencePath, emotionalTag);
    }
}
