// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectoralEthicsDAO {
    address public steward;

    struct EthicsEntry {
        string electionPhase;
        string ethicalViolation;
        string accountabilityAction;
        string emotionalTag;
    }

    EthicsEntry[] public registry;

    event ElectoralEthicsTagged(string electionPhase, string ethicalViolation, string accountabilityAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory electionPhase,
        string memory ethicalViolation,
        string memory accountabilityAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsEntry(electionPhase, ethicalViolation, accountabilityAction, emotionalTag));
        emit ElectoralEthicsTagged(electionPhase, ethicalViolation, accountabilityAction, emotionalTag);
    }
}
