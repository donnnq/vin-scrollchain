// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicSupportProtocolPackDAO {
    address public admin;

    struct ProtocolEntry {
        string supportType;
        string beneficiary;
        string protocolClause;
        string emotionalTag;
        bool deployed;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _supportType, string memory _beneficiary, string memory _protocolClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_supportType, _beneficiary, _protocolClause, _emotionalTag, false));
    }

    function deployProtocol(uint256 index) external onlyAdmin {
        protocols[index].deployed = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
