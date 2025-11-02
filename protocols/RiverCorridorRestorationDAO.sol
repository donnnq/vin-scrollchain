// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverCorridorRestorationDAO {
    address public steward;

    struct RestorationEntry {
        string riverName;
        string corridor;
        string restorationAction;
        string emotionalTag;
    }

    RestorationEntry[] public registry;

    event RestorationTagged(string riverName, string corridor, string restorationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRestoration(
        string memory riverName,
        string memory corridor,
        string memory restorationAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RestorationEntry(riverName, corridor, restorationAction, emotionalTag));
        emit RestorationTagged(riverName, corridor, restorationAction, emotionalTag);
    }
}
