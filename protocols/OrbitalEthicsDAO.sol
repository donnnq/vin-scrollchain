// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalEthicsDAO {
    address public steward;

    struct EthicsEntry {
        string satelliteType;
        string ethicalConcern;
        string orbitalProtocol;
        string emotionalTag;
    }

    EthicsEntry[] public registry;

    event OrbitalEthicsTagged(string satelliteType, string ethicalConcern, string orbitalProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory satelliteType,
        string memory ethicalConcern,
        string memory orbitalProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsEntry(satelliteType, ethicalConcern, orbitalProtocol, emotionalTag));
        emit OrbitalEthicsTagged(satelliteType, ethicalConcern, orbitalProtocol, emotionalTag);
    }
}
