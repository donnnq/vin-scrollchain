// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicInfrastructureJusticeDAO {
    address public steward;

    struct JusticeEntry {
        string projectName;
        string auditFocus;
        string equityProtocol;
        string emotionalTag;
    }

    JusticeEntry[] public registry;

    event InfrastructureJusticeTagged(string projectName, string auditFocus, string equityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagJustice(
        string memory projectName,
        string memory auditFocus,
        string memory equityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(JusticeEntry(projectName, auditFocus, equityProtocol, emotionalTag));
        emit InfrastructureJusticeTagged(projectName, auditFocus, equityProtocol, emotionalTag);
    }
}
