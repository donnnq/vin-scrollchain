// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MandirigmaMindanaoArchiveDAO {
    address public steward;

    struct ArchiveEntry {
        string veteranName;
        string campaignMemory;
        string wisdomProtocol;
        string emotionalTag;
    }

    ArchiveEntry[] public registry;

    event MindanaoMandirigmaArchived(string veteranName, string campaignMemory, string wisdomProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function archiveMandirigma(
        string memory veteranName,
        string memory campaignMemory,
        string memory wisdomProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ArchiveEntry(veteranName, campaignMemory, wisdomProtocol, emotionalTag));
        emit MindanaoMandirigmaArchived(veteranName, campaignMemory, wisdomProtocol, emotionalTag);
    }
}
