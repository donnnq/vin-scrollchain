// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectionWorkerProtectionCodex {
    address public steward;

    struct ProtectionEntry {
        string workerRole;
        string threatType;
        string protectionProtocol;
        string emotionalTag;
    }

    ProtectionEntry[] public codex;

    event ElectionWorkerProtectionLogged(string workerRole, string threatType, string protectionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logProtection(
        string memory workerRole,
        string memory threatType,
        string memory protectionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ProtectionEntry(workerRole, threatType, protectionProtocol, emotionalTag));
        emit ElectionWorkerProtectionLogged(workerRole, threatType, protectionProtocol, emotionalTag);
    }
}
