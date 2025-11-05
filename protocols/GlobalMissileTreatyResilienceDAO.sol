// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalMissileTreatyResilienceDAO {
    address public steward;

    struct TreatyEntry {
        string treatyName;
        string resilienceSignal;
        string enforcementMechanism;
        string emotionalTag;
    }

    TreatyEntry[] public registry;

    event MissileTreatyResilienceTagged(string treatyName, string resilienceSignal, string enforcementMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory treatyName,
        string memory resilienceSignal,
        string memory enforcementMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TreatyEntry(treatyName, resilienceSignal, enforcementMechanism, emotionalTag));
        emit MissileTreatyResilienceTagged(treatyName, resilienceSignal, enforcementMechanism, emotionalTag);
    }
}
