// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SealedArchiveEthicsDAO {
    address public steward;

    struct ArchiveEntry {
        string archiveName;
        string corridor;
        string sealStatus;
        string ethicalConcern;
        string emotionalTag;
    }

    ArchiveEntry[] public registry;

    event ArchiveTagged(string archiveName, string corridor, string sealStatus, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagArchive(
        string memory archiveName,
        string memory corridor,
        string memory sealStatus,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ArchiveEntry(archiveName, corridor, sealStatus, ethicalConcern, emotionalTag));
        emit ArchiveTagged(archiveName, corridor, sealStatus, ethicalConcern, emotionalTag);
    }
}
