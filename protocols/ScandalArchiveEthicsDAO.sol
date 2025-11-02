// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScandalArchiveEthicsDAO {
    address public steward;

    struct ArchiveEntry {
        string scandalName;
        string corridor;
        string ethicalVerdict;
        string emotionalTag;
    }

    ArchiveEntry[] public registry;

    event ScandalTagged(string scandalName, string corridor, string ethicalVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagScandal(
        string memory scandalName,
        string memory corridor,
        string memory ethicalVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ArchiveEntry(scandalName, corridor, ethicalVerdict, emotionalTag));
        emit ScandalTagged(scandalName, corridor, ethicalVerdict, emotionalTag);
    }
}
