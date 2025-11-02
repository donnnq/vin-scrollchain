// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RailwayUndersideBeautificationDAO {
    address public steward;

    struct BeautificationEntry {
        string location;
        string designElement;
        string communityPartner;
        string emotionalTag;
    }

    BeautificationEntry[] public registry;

    event UndersideBeautified(string location, string designElement, string communityPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function beautifyUnderside(
        string memory location,
        string memory designElement,
        string memory communityPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BeautificationEntry(location, designElement, communityPartner, emotionalTag));
        emit UndersideBeautified(location, designElement, communityPartner, emotionalTag);
    }
}
