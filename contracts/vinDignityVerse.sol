// SPDX-License-Identifier: Dignity-NFT
pragma solidity ^0.8.19;

contract vinDignityVerse {
    address public sovereignArtist;
    string public civicMessage;
    string public metadataURI;
    bool public minted;

    event DignityMinted(string message, string uri);

    modifier onlySovereign() {
        require(msg.sender == sovereignArtist, "Unauthorized mint access");
        _;
    }

    constructor(string memory _message, string memory _uri) {
        sovereignArtist = msg.sender;
        civicMessage = _message;
        metadataURI = _uri;
        minted = false;
    }

    function mintScrollNFT() external onlySovereign {
        require(!minted, "Already minted");
        minted = true;
        emit DignityMinted(civicMessage, metadataURI);
    }
}
