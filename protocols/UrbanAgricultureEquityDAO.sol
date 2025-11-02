// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanAgricultureEquityDAO {
    address public steward;

    struct AgricultureEntry {
        string city;
        string cropType;
        string equityStatus;
        string emotionalTag;
    }

    AgricultureEntry[] public registry;

    event AgricultureTagged(string city, string cropType, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagAgriculture(
        string memory city,
        string memory cropType,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AgricultureEntry(city, cropType, equityStatus, emotionalTag));
        emit AgricultureTagged(city, cropType, equityStatus, emotionalTag);
    }
}
