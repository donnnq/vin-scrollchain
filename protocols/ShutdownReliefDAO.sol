// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownReliefDAO {
    address public steward;

    struct ReliefEntry {
        string shutdownPhase;
        string reliefBarrier;
        string emergencyProtocol;
        string emotionalTag;
    }

    ReliefEntry[] public registry;

    event ShutdownReliefTagged(string shutdownPhase, string reliefBarrier, string emergencyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelief(
        string memory shutdownPhase,
        string memory reliefBarrier,
        string memory emergencyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ReliefEntry(shutdownPhase, reliefBarrier, emergencyProtocol, emotionalTag));
        emit ShutdownReliefTagged(shutdownPhase, reliefBarrier, emergencyProtocol, emotionalTag);
    }
}
