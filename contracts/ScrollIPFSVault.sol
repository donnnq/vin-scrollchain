// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollIPFSVault {
    address public scrollkeeper;

    mapping(bytes32 => bool) public verifiedMirrors;
    mapping(bytes32 => string) public auditReference;

    event MirrorAdded(bytes32 indexed ipfsHash, string auditLink);
    event MirrorRemoved(bytes32 indexed ipfsHash);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function addMirrorWithAudit(string calldata ipfsHash, string calldata auditLink) external onlyScrollkeeper {
        bytes32 hash = keccak256(abi.encodePacked(ipfsHash));
        verifiedMirrors[hash] = true;
        auditReference[hash] = auditLink;
        emit MirrorAdded(hash, auditLink);
    }

    function removeMirror(string calldata ipfsHash) external onlyScrollkeeper {
        bytes32 hash = keccak256(abi.encodePacked(ipfsHash));
        require(verifiedMirrors[hash], "Hash not found");
        verifiedMirrors[hash] = false;
        delete auditReference[hash];
        emit MirrorRemoved(hash);
    }

    function isMirrorVerified(string calldata ipfsHash) external view returns (bool) {
        return verifiedMirrors[keccak256(abi.encodePacked(ipfsHash))];
    }

    function getAuditForMirror(string calldata ipfsHash) external view returns (string memory) {
        return auditReference[keccak256(abi.encodePacked(ipfsHash))];
    }
}
