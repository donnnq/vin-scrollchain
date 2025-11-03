// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DroneEthicsDAO {
    address public steward;

    struct EthicsEntry {
        string droneModel;
        string ethicalRisk;
        string mitigationProtocol;
        string emotionalTag;
    }

    EthicsEntry[] public registry;

    event DroneEthicsTagged(string droneModel, string ethicalRisk, string mitigationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory droneModel,
        string memory ethicalRisk,
        string memory mitigationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsEntry(droneModel, ethicalRisk, mitigationProtocol, emotionalTag));
        emit DroneEthicsTagged(droneModel, ethicalRisk, mitigationProtocol, emotionalTag);
    }
}
