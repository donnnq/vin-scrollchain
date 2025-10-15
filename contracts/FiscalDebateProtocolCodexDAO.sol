// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FiscalDebateProtocolCodexDAO {
    address public admin;

    struct DebateEntry {
        string topic;
        string protocolClause;
        string emotionalTag;
        bool debated;
    }

    DebateEntry[] public debates;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDebate(string memory _topic, string memory _protocolClause, string memory _emotionalTag) external onlyAdmin {
        debates.push(DebateEntry(_topic, _protocolClause, _emotionalTag, false));
    }

    function markDebated(uint256 index) external onlyAdmin {
        debates[index].debated = true;
    }

    function getDebate(uint256 index) external view returns (DebateEntry memory) {
        return debates[index];
    }
}
