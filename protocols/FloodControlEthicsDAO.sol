// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlEthicsDAO {
    address public steward;

    struct EthicsEntry {
        string projectName;
        string ethicsDomain;
        string ethicsSignal;
        string emotionalTag;
    }

    EthicsEntry[] public registry;

    event FloodEthicsTagged(string projectName, string ethicsDomain, string ethicsSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory projectName,
        string memory ethicsDomain,
        string memory ethicsSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EthicsEntry(projectName, ethicsDomain, ethicsSignal, emotionalTag));
        emit FloodEthicsTagged(projectName, ethicsDomain, ethicsSignal, emotionalTag);
    }
}
