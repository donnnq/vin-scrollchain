// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemorialParkLegacyIndex {
    address public steward;

    struct LegacyEntry {
        string parkName;
        string location;
        string heritageValue;
        string emotionalTag;
    }

    LegacyEntry[] public index;

    event MemorialParkTagged(string parkName, string location, string heritageValue, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPark(
        string memory parkName,
        string memory location,
        string memory heritageValue,
        string memory emotionalTag
    ) public onlySteward {
        index.push(LegacyEntry(parkName, location, heritageValue, emotionalTag));
        emit MemorialParkTagged(parkName, location, heritageValue, emotionalTag);
    }
}
