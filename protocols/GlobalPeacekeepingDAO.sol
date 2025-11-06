// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalPeacekeepingDAO {
    address public steward;

    struct PeacekeepingEntry {
        string conflictZone;
        string peaceAction;
        string coordinationProtocol;
        string emotionalTag;
    }

    PeacekeepingEntry[] public registry;

    event GlobalPeacekeepingTagged(string conflictZone, string peaceAction, string coordinationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPeacekeeping(
        string memory conflictZone,
        string memory peaceAction,
        string memory coordinationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(PeacekeepingEntry(conflictZone, peaceAction, coordinationProtocol, emotionalTag));
        emit GlobalPeacekeepingTagged(conflictZone, peaceAction, coordinationProtocol, emotionalTag);
    }
}
