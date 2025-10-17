// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksTransparencyCodex {
    address public admin;

    struct TransparencyEntry {
        string projectName;
        string agency;
        string emotionalTag;
        bool published;
        bool searchable;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function publishProject(string memory projectName, string memory agency, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(projectName, agency, emotionalTag, true, false));
    }

    function enableSearch(uint256 index) external onlyAdmin {
        entries[index].searchable = true;
    }

    function getTransparency(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
