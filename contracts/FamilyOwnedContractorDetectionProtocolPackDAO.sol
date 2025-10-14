// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FamilyOwnedContractorDetectionProtocolPackDAO {
    address public admin;

    struct ProtocolEntry {
        string contractorGroup;
        string detectionMethod;
        string emotionalTag;
        bool flagged;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _contractorGroup, string memory _detectionMethod, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_contractorGroup, _detectionMethod, _emotionalTag, false));
    }

    function flagProtocol(uint256 index) external onlyAdmin {
        protocols[index].flagged = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
