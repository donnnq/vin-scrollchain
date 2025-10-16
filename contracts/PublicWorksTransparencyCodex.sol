// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksTransparencyCodex {
    address public admin;

    struct DisclosureEntry {
        string officialName;
        string contractorLink;
        string projectScope;
        string emotionalTag;
        bool disclosed;
        bool flagged;
    }

    DisclosureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logDisclosure(string memory officialName, string memory contractorLink, string memory projectScope, string memory emotionalTag) external onlyAdmin {
        entries.push(DisclosureEntry(officialName, contractorLink, projectScope, emotionalTag, true, false));
    }

    function flagConflict(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getDisclosure(uint256 index) external view returns (DisclosureEntry memory) {
        return entries[index];
    }
}
