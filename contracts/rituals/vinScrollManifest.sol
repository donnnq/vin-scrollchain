// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollManifest — Registry of scrolls with symbolic metadata
contract vinScrollManifest {
    struct Scroll {
        string title;
        string purpose;
        address author;
        uint256 timestamp;
    }

    Scroll[] public registry;

    event ScrollRegistered(string title, address indexed author, string purpose);

    function registerScroll(string memory title, string memory purpose) external {
        registry.push(Scroll({
            title: title,
            purpose: purpose,
            author: msg.sender,
            timestamp: block.timestamp
        }));

        emit ScrollRegistered(title, msg.sender, purpose);
    }

    function getScrollsBy(address author) external view returns (Scroll[] memory filtered) {
        uint256 count;
        for (uint i = 0; i < registry.length; i++) {
            if (registry[i].author == author) count++;
        }

        filtered = new Scroll[](count);
        uint256 idx;
        for (uint i = 0; i < registry.length; i++) {
            if (registry[i].author == author) {
                filtered[idx++] = registry[i];
            }
        }
    }

    function totalScrolls() external view returns (uint256) {
        return registry.length;
    }
}
