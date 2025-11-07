// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalletToPDFLinkageProtocol {
    address public steward;

    struct LinkageEntry {
        string walletAddress;
        string pdfReference;
        string verificationMethod;
        string timestamp;
        string emotionalTag;
    }

    LinkageEntry[] public registry;

    event WalletLinked(string walletAddress, string pdfReference, string verificationMethod, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function linkWalletToPDF(
        string memory walletAddress,
        string memory pdfReference,
        string memory verificationMethod,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LinkageEntry(walletAddress, pdfReference, verificationMethod, timestamp, emotionalTag));
        emit WalletLinked(walletAddress, pdfReference, verificationMethod, timestamp, emotionalTag);
    }
}
