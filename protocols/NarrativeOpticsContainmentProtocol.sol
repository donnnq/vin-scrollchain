// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeOpticsContainmentProtocol {
    address public steward;

    struct OpticsEntry {
        string timestamp;
        string faithBloc;
        string mediaEvent;
        string opticsStrategy;
        string containmentAction;
        string emotionalTag;
    }

    OpticsEntry[] public protocol;

    event OpticsContained(string timestamp, string faithBloc, string mediaEvent, string opticsStrategy, string containmentAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containOptics(
        string memory timestamp,
        string memory faithBloc,
        string memory mediaEvent,
        string memory opticsStrategy,
        string memory containmentAction,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(OpticsEntry(timestamp, faithBloc, mediaEvent, opticsStrategy, containmentAction, emotionalTag));
        emit OpticsContained(timestamp, faithBloc, mediaEvent, opticsStrategy, containmentAction, emotionalTag);
    }
}
