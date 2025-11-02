// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModDownloadIntegrityDAO {
    address public steward;

    struct ModLinkEntry {
        string siteName;
        string modTitle;
        string linkStatus;
        string emotionalTag;
    }

    ModLinkEntry[] public registry;

    event ModLinkTagged(string siteName, string modTitle, string linkStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagModLink(
        string memory siteName,
        string memory modTitle,
        string memory linkStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ModLinkEntry(siteName, modTitle, linkStatus, emotionalTag));
        emit ModLinkTagged(siteName, modTitle, linkStatus, emotionalTag);
    }
}
