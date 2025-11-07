// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivilianAttackAccountabilityDAO {
    address public steward;

    struct AttackEntry {
        string location;
        string perpetrator;
        string violationType;
        string emotionalTag;
    }

    AttackEntry[] public registry;

    event CivilianAttackTagged(string location, string perpetrator, string violationType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAttack(
        string memory location,
        string memory perpetrator,
        string memory violationType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AttackEntry(location, perpetrator, violationType, emotionalTag));
        emit CivilianAttackTagged(location, perpetrator, violationType, emotionalTag);
    }
}
