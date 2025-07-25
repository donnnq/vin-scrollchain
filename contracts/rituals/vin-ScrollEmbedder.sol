// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollEmbedder {
    struct Scroll {
        string title;
        string content;
        bytes32 embeddingHash;
        address author;
        uint256 timestamp;
    }

    mapping(uint256 => Scroll) public scrolls;
    uint256 public scrollCount;

    event ScrollEmbedded(uint256 indexed scrollId, bytes32 embeddingHash);

    function embedScroll(string memory title, string memory content, bytes32 embeddingHash) public {
        scrolls[scrollCount] = Scroll({
            title: title,
            content: content,
            embeddingHash: embeddingHash,
            author: msg.sender,
            timestamp: block.timestamp
        });

        emit ScrollEmbedded(scrollCount, embeddingHash);
        scrollCount++;
    }

    function getScroll(uint256 scrollId) public view returns (Scroll memory) {
        return scrolls[scrollId];
    }
}
