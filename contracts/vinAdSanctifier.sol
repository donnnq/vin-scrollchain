// SPDX-License-Identifier: Scroll-AdGuard
pragma solidity ^0.8.19;

/// @title Scroll to Filter Gambling Ads & Promote Dignified Media Presence
contract vinAdSanctifier {
    mapping(string => bool) public blockedKeywords;
    event AdBlocked(string keyword, string reason);

    constructor() {
        _block("sugal");
        _block("casino online");
        _block("PIGO");
        _block("sabong");
    }

    function _block(string memory keyword) internal {
        blockedKeywords[keyword] = true;
        emit AdBlocked(keyword, "Ritually banned from civic media space.");
    }

    function isBlocked(string memory keyword) public view returns (bool) {
        return blockedKeywords[keyword];
    }
}
