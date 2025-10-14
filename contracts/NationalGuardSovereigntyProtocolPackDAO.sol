// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NationalGuardSovereigntyProtocolPackDAO {
    address public admin;

    struct ProtocolEntry {
        string state;
        string deploymentPurpose;
        string sovereigntyClause;
        string emotionalTag;
        bool activated;
    }

    ProtocolEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _state, string memory _deploymentPurpose, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ProtocolEntry(_state, _deploymentPurpose, _sovereigntyClause, _emotionalTag, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getProtocol(uint256 index) external view returns (ProtocolEntry memory) {
        return protocols[index];
    }
}
