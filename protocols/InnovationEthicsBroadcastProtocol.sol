// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InnovationEthicsBroadcastProtocol {
    address public steward;

    struct EthicsEntry {
        string innovationType;
        string ethicalConcern;
        string broadcastProtocol;
        string emotionalTag;
    }

    EthicsEntry[] public registry;

    event InnovationEthicsBroadcasted(string innovationType, string ethicalConcern, string broadcastProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastEthics(
        string memory innovationType,
        string memory ethicalConcern,
        string memory broadcastProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsEntry(innovationType, ethicalConcern, broadcastProtocol, emotionalTag));
        emit InnovationEthicsBroadcasted(innovationType, ethicalConcern, broadcastProtocol, emotionalTag);
    }
}
