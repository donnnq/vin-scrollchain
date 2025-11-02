// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreativeImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string creator;
        string violationType;
        string defenseAction;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event CreativeImmunityTagged(string creator, string violationType, string defenseAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory creator,
        string memory violationType,
        string memory defenseAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(creator, violationType, defenseAction, emotionalTag));
        emit CreativeImmunityTagged(creator, violationType, defenseAction, emotionalTag);
    }
}
