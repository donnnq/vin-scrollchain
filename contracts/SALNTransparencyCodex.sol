// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SALNTransparencyCodex {
    address public admin;

    struct SALNEntry {
        string officialName;
        string position;
        string emotionalTag;
        bool filed;
        bool publiclyAccessible;
    }

    SALNEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileSALN(string memory officialName, string memory position, string memory emotionalTag) external onlyAdmin {
        entries.push(SALNEntry(officialName, position, emotionalTag, true, false));
    }

    function makePublic(uint256 index) external onlyAdmin {
        entries[index].publiclyAccessible = true;
    }

    function getSALN(uint256 index) external view returns (SALNEntry memory) {
        return entries[index];
    }
}
