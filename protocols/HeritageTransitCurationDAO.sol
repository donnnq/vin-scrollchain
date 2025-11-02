// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageTransitCurationDAO {
    address public steward;

    struct HeritageEntry {
        string stationName;
        string heritageElement;
        string corridor;
        string emotionalTag;
    }

    HeritageEntry[] public registry;

    event HeritageTagged(string stationName, string heritageElement, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagHeritage(
        string memory stationName,
        string memory heritageElement,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(HeritageEntry(stationName, heritageElement, corridor, emotionalTag));
        emit HeritageTagged(stationName, heritageElement, corridor, emotionalTag);
    }
}
