// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollIPFSVault {
    address public scrollkeeper;
    mapping(bytes32 => bool) public verifiedMirrors;
    event MirrorAdded(bytes32 indexed ipfsHash);
    event MirrorRemoved(bytes32 indexed ipfsHash);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function addMirror(string calldata ipfsHash) external onlyScrollkeeper {
        bytes32 hash = keccak256(abi.encodePacked(ipfsHash));
        verifiedMirrors[hash] = true;
        emit MirrorAdded(hash);
    }

    function removeMirror(string calldata ipfsHash) external onlyScrollkeeper {
        bytes32 hash = keccak256(abi.encodePacked(ipfsHash));
        require(verifiedMirrors[hash], "Hash not found");
        verifiedMirrors[hash] = false;
        emit MirrorRemoved(hash);
    }

    function isMirrorVerified(string calldata ipfsHash) external view returns (bool) {
        return verifiedMirrors[keccak256(abi.encodePacked(ipfsHash))];
    }
}
