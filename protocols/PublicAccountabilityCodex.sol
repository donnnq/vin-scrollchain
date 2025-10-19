// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAccountabilityCodex {
    address public admin;

    struct StatementEntry {
        string official;
        string topic;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    StatementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStatement(string memory official, string memory topic, string memory emotionalTag) external onlyAdmin {
        entries.push(StatementEntry(official, topic, emotionalTag, true, false, false));
    }

    function verifyStatement(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealStatement(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getStatementEntry(uint256 index) external view returns (StatementEntry memory) {
        return entries[index];
    }
}
