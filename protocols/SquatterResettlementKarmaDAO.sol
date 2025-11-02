// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SquatterResettlementKarmaDAO {
    address public steward;

    struct ResettlementEntry {
        string communityName;
        string corridor;
        string resettlementAction;
        string emotionalTag;
    }

    ResettlementEntry[] public registry;

    event ResettlementTagged(string communityName, string corridor, string resettlementAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagResettlement(
        string memory communityName,
        string memory corridor,
        string memory resettlementAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResettlementEntry(communityName, corridor, resettlementAction, emotionalTag));
        emit ResettlementTagged(communityName, corridor, resettlementAction, emotionalTag);
    }
}
