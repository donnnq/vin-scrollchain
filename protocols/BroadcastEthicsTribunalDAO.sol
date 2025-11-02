// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastEthicsTribunalDAO {
    address public steward;

    struct TribunalEntry {
        string broadcaster;
        string corridor;
        string ethicsVerdict;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event EthicsJudged(string broadcaster, string corridor, string ethicsVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeEthics(
        string memory broadcaster,
        string memory corridor,
        string memory ethicsVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(broadcaster, corridor, ethicsVerdict, emotionalTag));
        emit EthicsJudged(broadcaster, corridor, ethicsVerdict, emotionalTag);
    }
}
