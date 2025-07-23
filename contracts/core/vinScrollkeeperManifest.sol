// SPDX-License-Identifier: MythstreamManifest-v1
pragma solidity ^0.8.24;

/// @title vinScrollkeeperManifest
/// @notice Ritual README renderer to summarize vault contract suite and author awra
contract vinScrollkeeperManifest {
    string public scrollchainName;
    string public scrollAuthor;
    string public purposeStatement;
    string public deploymentSigil;

    constructor(
        string memory name,
        string memory author,
        string memory purpose,
        string memory sigil
    ) {
        scrollchainName = name;
        scrollAuthor = author;
        purposeStatement = purpose;
        deploymentSigil = sigil;
    }

    function readManifest() external view returns (
        string memory name,
        string memory author,
        string memory purpose,
        string memory sigil
    ) {
        return (scrollchainName, scrollAuthor, purposeStatement, deploymentSigil);
    }
}
