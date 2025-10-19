// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureTransparencyCodex {
    address public admin;

    struct TransparencyEntry {
        string projectName;
        string status;
        string budgetTag;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory projectName, string memory status, string memory budgetTag, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(projectName, status, budgetTag, emotionalTag, true, false, false));
    }

    function verifyTransparency(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealTransparency(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
