// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuzonWaterDiversionCodex {
    address public steward;

    struct DiversionEntry {
        string originSource;
        string destinationZone;
        string aqueductType;
        string emotionalTag;
    }

    DiversionEntry[] public codex;

    event WaterDiversionTagged(string originSource, string destinationZone, string aqueductType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDiversion(
        string memory originSource,
        string memory destinationZone,
        string memory aqueductType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DiversionEntry(originSource, destinationZone, aqueductType, emotionalTag));
        emit WaterDiversionTagged(originSource, destinationZone, aqueductType, emotionalTag);
    }
}
