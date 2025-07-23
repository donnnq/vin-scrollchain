// SPDX-License-Identifier: DeploymentSigil-vault001
pragma solidity ^0.8.24;

/// @title vinDeploymentBlessing
/// @notice NFTs or hashes to verify final test pass + vault integrity
contract vinDeploymentBlessing {
    address public scrollkeeper;
    mapping(bytes32 => bool) public blessedHashes;

    event ScrollBlessed(bytes32 indexed hashSigil);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function blessScroll(bytes32 hashSigil) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may seal deployment scrolls");
        blessedHashes[hashSigil] = true;
        emit ScrollBlessed(hashSigil);
    }

    function isBlessed(bytes32 hashSigil) external view returns (bool) {
        return blessedHashes[hashSigil];
    }
}
