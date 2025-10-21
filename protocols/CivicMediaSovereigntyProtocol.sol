// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicMediaSovereigntyProtocol {
    address public admin;

    struct MediaEntry {
        string network;
        string contentType; // "News", "Audit Coverage", "Public Testimony"
        string sovereigntyClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    MediaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMedia(string memory network, string memory contentType, string memory sovereigntyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MediaEntry(network, contentType, sovereigntyClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealMediaEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getMediaEntry(uint256 index) external view returns (MediaEntry memory) {
        return entries[index];
    }
}
