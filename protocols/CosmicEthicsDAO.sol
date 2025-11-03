// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CosmicEthicsDAO {
    address public steward;

    struct EthicsEntry {
        string celestialEntity;
        string ethicalConcern;
        string containmentProtocol;
        string emotionalTag;
    }

    EthicsEntry[] public registry;

    event CosmicEthicsTagged(string celestialEntity, string ethicalConcern, string containmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory celestialEntity,
        string memory ethicalConcern,
        string memory containmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsEntry(celestialEntity, ethicalConcern, containmentProtocol, emotionalTag));
        emit CosmicEthicsTagged(celestialEntity, ethicalConcern, containmentProtocol, emotionalTag);
    }
}
