// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UndasInfrastructureCodex {
    address public steward;

    struct InfrastructureEntry {
        string location;
        string comfortFeature;
        string ritualSupport;
        string emotionalTag;
    }

    InfrastructureEntry[] public codex;

    event UndasInfrastructureLogged(string location, string comfortFeature, string ritualSupport, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logInfrastructure(
        string memory location,
        string memory comfortFeature,
        string memory ritualSupport,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(InfrastructureEntry(location, comfortFeature, ritualSupport, emotionalTag));
        emit UndasInfrastructureLogged(location, comfortFeature, ritualSupport, emotionalTag);
    }
}
