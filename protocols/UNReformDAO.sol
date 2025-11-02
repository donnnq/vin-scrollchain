// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UNReformDAO {
    address public steward;

    struct ReformEntry {
        string reformActor;
        string reformDemand;
        string UNBodyTargeted;
        string emotionalTag;
    }

    ReformEntry[] public registry;

    event UNReformTagged(string reformActor, string reformDemand, string UNBodyTargeted, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReform(
        string memory reformActor,
        string memory reformDemand,
        string memory UNBodyTargeted,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ReformEntry(reformActor, reformDemand, UNBodyTargeted, emotionalTag));
        emit UNReformTagged(reformActor, reformDemand, UNBodyTargeted, emotionalTag);
    }
}
