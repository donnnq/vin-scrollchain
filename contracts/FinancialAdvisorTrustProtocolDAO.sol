// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinancialAdvisorTrustProtocolDAO {
    address public admin;

    struct ProtocolEntry {
        string advisorName;
        string trustClause;
        string emotionalTag;
        bool ratified;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _advisorName, string memory _trustClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_advisorName, _trustClause, _emotionalTag, false));
    }

    function ratifyProtocol(uint256 index) external onlyAdmin {
        protocols[index].ratified = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
