// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToUAPTransparencyGrid {
    string public batchID = "1321.9.107";
    string public steward = "Vinvin";

    address public admin;

    struct Evidence {
        string description;
        string origin;
        uint256 timestamp;
        bool verified;
    }

    mapping(bytes32 => Evidence) public evidenceRegistry;

    event EvidenceLogged(bytes32 indexed key, string description, string origin);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEvidence(string memory description, string memory origin) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(description, origin, block.timestamp));
        evidenceRegistry[key] = Evidence(description, origin, block.timestamp, false);
        emit EvidenceLogged(key, description, origin);
    }

    function verifyEvidence(bytes32 key) public onlyAdmin {
        evidenceRegistry[key].verified = true;
    }

    function getEvidence(bytes32 key) public view returns (string memory description, string memory origin, uint256 timestamp, bool verified) {
        Evidence memory e = evidenceRegistry[key];
        return (e.description, e.origin, e.timestamp, e.verified);
    }
}
