// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorBlacklistProtocolPackDAO {
    address public admin;

    struct ProtocolEntry {
        string contractorName;
        string violationType;
        string blacklistClause;
        string emotionalTag;
        bool enforced;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _contractorName, string memory _violationType, string memory _blacklistClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_contractorName, _violationType, _blacklistClause, _emotionalTag, false));
    }

    function enforceProtocol(uint256 index) external onlyAdmin {
        protocols[index].enforced = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
