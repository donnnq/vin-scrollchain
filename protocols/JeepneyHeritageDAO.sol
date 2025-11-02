// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JeepneyHeritageDAO {
    address public steward;

    struct JeepneyEntry {
        string route;
        string jeepneyType;
        string heritageStatus;
        string emotionalTag;
    }

    JeepneyEntry[] public registry;

    event JeepneyTagged(string route, string jeepneyType, string heritageStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagJeepney(
        string memory route,
        string memory jeepneyType,
        string memory heritageStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(JeepneyEntry(route, jeepneyType, heritageStatus, emotionalTag));
        emit JeepneyTagged(route, jeepneyType, heritageStatus, emotionalTag);
    }
}
