// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactoryExodusLedger {
    address public steward;

    struct ExodusEntry {
        string factoryName;
        string originCorridor;
        string destinationCorridor;
        string reason;
        string emotionalTag;
    }

    ExodusEntry[] public ledger;

    event ExodusLogged(string factoryName, string originCorridor, string destinationCorridor, string reason, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logExodus(
        string memory factoryName,
        string memory originCorridor,
        string memory destinationCorridor,
        string memory reason,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ExodusEntry(factoryName, originCorridor, destinationCorridor, reason, emotionalTag));
        emit ExodusLogged(factoryName, originCorridor, destinationCorridor, reason, emotionalTag);
    }
}
