// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeopoliticalLeakMuseum {
    address public steward;

    struct LeakArtifact {
        string actor;
        string leakCorridor;
        uint256 leakValueUSD;
        string emotionalTag;
    }

    LeakArtifact[] public registry;

    event LeakArchived(string actor, string leakCorridor, uint256 leakValueUSD, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveLeak(
        string memory actor,
        string memory leakCorridor,
        uint256 leakValueUSD,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LeakArtifact(actor, leakCorridor, leakValueUSD, emotionalTag));
        emit LeakArchived(actor, leakCorridor, leakValueUSD, emotionalTag);
    }
}
