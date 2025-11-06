// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanCoolingIndex {
    address public steward;

    struct CoolingEntry {
        string zone;
        string temperatureDelta;
        string coolingProtocol;
        string emotionalTag;
    }

    CoolingEntry[] public index;

    event UrbanCoolingTagged(string zone, string temperatureDelta, string coolingProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCooling(
        string memory zone,
        string memory temperatureDelta,
        string memory coolingProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(CoolingEntry(zone, temperatureDelta, coolingProtocol, emotionalTag));
        emit UrbanCoolingTagged(zone, temperatureDelta, coolingProtocol, emotionalTag);
    }
}
