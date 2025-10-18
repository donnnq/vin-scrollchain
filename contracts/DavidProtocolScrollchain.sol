// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DavidProtocolScrollchain {
    address public admin;

    struct ProtocolEntry {
        string adversary;
        string tacticUsed;
        string emotionalTag;
        bool summoned;
        bool victorious;
    }

    ProtocolEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtocol(string memory adversary, string memory tacticUsed, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtocolEntry(adversary, tacticUsed, emotionalTag, true, false));
    }

    function declareVictory(uint256 index) external onlyAdmin {
        entries[index].victorious = true;
    }

    function getProtocolEntry(uint256 index) external view returns (ProtocolEntry memory) {
        return entries[index];
    }
}
