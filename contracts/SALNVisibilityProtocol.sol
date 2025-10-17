// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SALNVisibilityProtocol {
    address public admin;

    struct SALNEntry {
        string officialName;
        string position;
        string emotionalTag;
        bool disclosed;
        bool audited;
    }

    SALNEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function discloseSALN(string memory officialName, string memory position, string memory emotionalTag) external onlyAdmin {
        entries.push(SALNEntry(officialName, position, emotionalTag, true, false));
    }

    function auditSALN(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getSALNEntry(uint256 index) external view returns (SALNEntry memory) {
        return entries[index];
    }
}
