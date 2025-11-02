// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AerialTransitNodeCodex {
    address public steward;

    struct TransitNode {
        string nodeName;
        string elevationType;
        string accessMode;
        string emotionalTag;
    }

    TransitNode[] public codex;

    event TransitNodeLogged(string nodeName, string elevationType, string accessMode, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logTransitNode(
        string memory nodeName,
        string memory elevationType,
        string memory accessMode,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TransitNode(nodeName, elevationType, accessMode, emotionalTag));
        emit TransitNodeLogged(nodeName, elevationType, accessMode, emotionalTag);
    }
}
